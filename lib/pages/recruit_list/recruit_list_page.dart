import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/components/simple_webview.dart';
import 'package:flutter_app/entities/recruit.dart';
import 'package:flutter_app/styles/custom_colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

const providerLogoPath = "assets/images/provider_logo/";
const orderOption = {
  "latest": "최신순",
  "populer": "인기순",
  "expire": "마감순",
};
const providerMap = {
  '': '전체',
  'saramin': '사람인',
  'peoplenjob': '피플앤잡',
  'incruit': '인크루트',
};
const String apiUrl = 'https://api.v-connect.kr/recruits?active=yes';

class RecruitListPage extends HookConsumerWidget {
  const RecruitListPage({Key? key}) : super(key: key);

  @override
  build(context, ref) {
    //Top Tab 영역 상태
    final selected_provider_state = useState<String>('');
    final selectedOrderState = useState<String?>('latest'); // 선택된 드롭다운 항목의 상태

    // 상태 관리 변수들
    final recruits = useState<List<Map<String, dynamic>>>([]); //채용리스트들
    final isLoadingMore = useState<bool>(false); // 로딩상태
    final hasMore = useState<bool>(true); // 더 로드할 데이터가 있는지 여부
    final page = useState<int>(1); // 현재 페이지

    //화면 스크롤
    final scrollController = useScrollController();
    final isScrollingNotifier = useState<bool>(false);

    // 데이터 로딩 함수
    Future<void> _initRecruitData() async {
      if (isLoadingMore.value || !hasMore.value) return;

      isLoadingMore.value = true;
      Map<String, dynamic> urlParam = {};
      Uri existing_uri = Uri.parse(apiUrl);

      if (selected_provider_state.value.isNotEmpty) {
        urlParam['provider'] = '${selected_provider_state.value}';
      }

      urlParam['page'] = '${page.value}';
      urlParam['order'] = '${selectedOrderState.value}';
      Uri resultUri = existing_uri.replace(queryParameters: urlParam);

      try {
        final response = await http.get(resultUri);
        if (response.statusCode == 200) {
          final List<dynamic> next_recruit_data = json.decode(response.body)['recruits'];
          if (next_recruit_data.isNotEmpty) {
            recruits.value = [...recruits.value, ...next_recruit_data.map((e) => Map<String, dynamic>.from(e as Map))];
            page.value++; // 페이지 번호 증가
          } else {
            hasMore.value = false; // 더 이상 로드할 데이터가 없음
          }
        } else {
          throw Exception('Failed to load data from the API');
        }
      } catch (e) {
        print(e);
      } finally {
        isLoadingMore.value = false;
      }
    }

    _handleUserStopScrolling() {
      if (scrollController.position.userScrollDirection == ScrollDirection.idle) {
        // 스크롤이 멈췄을 때 SliverAppBar를 나타나게 합니다.
        isScrollingNotifier.value = false;
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        // 스크롤을 위로 할 때 SliverAppBar를 나타나게 합니다.
        isScrollingNotifier.value = false;
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        // 스크롤을 아래로 할 때 SliverAppBar를 숨깁니다.
        isScrollingNotifier.value = true;
      }

      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        _initRecruitData();
      }
    }

    useEffect(() {
      _initRecruitData(); //초기데이터 호출
      scrollController.addListener(() {
        // 스크롤 리스너 등록
        isScrollingNotifier.value = true; //초기에 상단에 보여줘야하니 true처리
        _handleUserStopScrolling(); // 리스트 마지막 영역에 다다르면 새로 이벤트 호출 및 스크롤 이벤트
      });
      return () => scrollController.removeListener(_handleUserStopScrolling);
    }, [scrollController]);

    AppBar _appBar() {
      return AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: const SizedBox(),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          height: 56.0,
          child: Text(
            '채용공고',
          ),
        ),
      );
    }

    Widget _body() {
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is UserScrollNotification && scrollNotification.direction == ScrollDirection.idle) {
            _handleUserStopScrolling();
          }
          return false;
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              toolbarHeight: 130.0,
              forceElevated: false,
              leading: const SizedBox(),
              backgroundColor: CustomColors.white,
              shadowColor: Colors.transparent,
              // 그림자 색상을 투명하게 설정
              snap: !isScrollingNotifier.value,
              floating: !isScrollingNotifier.value,
              pinned: !isScrollingNotifier.value,
              // SliverAppBar가 상단에 고정되지 않도록 설정
              expandedHeight: 90.0,
              // 여기에 expandedHeight의 값을 조정하여 공간을 설정합니다.
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: CustomColors.white,
                  width: double.infinity,
                  height: 56.0,
                  //color: CustomColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: providerMap.entries.map((MapEntry<String, String> entry) {
                            bool isSelected = selected_provider_state.value == entry.key;
                            return Expanded(
                              // 각 항목을 Expanded 위젯으로 감싸기
                              child: InkWell(
                                onTap: () {
                                  selected_provider_state.value = entry.key;
                                  page.value = 1; // 새로운 탭이동 페이지 초기화
                                  recruits.value = [];
                                  hasMore.value = true;
                                  _initRecruitData();
                                },
                                child: Container(
                                  height: 55.0,
                                  decoration: isSelected
                                      ? const BoxDecoration(
                                          //color: CustomColors.white,
                                          color: Colors.white,
                                          // 선택된 항목 배경색 설정 (선택사항)
                                          border: Border(
                                            bottom: BorderSide(
                                              //color: CustomColors.blueBlack,
                                              color: Colors.black,
                                              // 선택된 항목 border 색상
                                              width: 3.0, // 선택된 항목 border 두께
                                            ),
                                          ),
                                        )
                                      : const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              //color: CustomColors.black10,
                                              color: Colors.black,
                                              // 선택되지 않은 항목 border 색상
                                              width: 1.0, // 선택되지 않은 항목 border 두께
                                            ),
                                          ),
                                        ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(7.0),
                                      child: Text(
                                        '${entry.value}',
                                        textAlign: TextAlign.center,
                                        //style: isSelected ? CustomTextStyles.callout.fontBold() : CustomTextStyles.callout.fontNormal(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            color: Colors.white,
                            height: 35,
                            //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownButton<String>(
                                  items: orderOption.entries.map((MapEntry<String, String> entry) {
                                    return DropdownMenuItem<String>(
                                      value: entry.key,
                                      child: Text(entry.value),
                                    );
                                  }).toList(),
                                  icon: Icon(Icons.expand_more),
                                  underline: Container(),
                                  onChanged: (value) {
                                    selectedOrderState.value = value;
                                  },
                                  hint: selectedOrderState.value == null
                                      ? Text(orderOption[selectedOrderState.value]!)
                                      : Text(orderOption[selectedOrderState.value]!),
                                  // 선택된 값이 없으면 힌트를 표시, 있으면 선택된 값을 표시
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // 스크롤 가능한 나머지 컨텐츠를 SliverList로 변환합니다.
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < recruits.value.length) {
                    // 정상적인 데이터 아이템
                    return createJobCardsFromJsonData(context, recruits.value)[index];
                  } else if (hasMore.value) {
                    // 로딩 인디케이터
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    // 더 이상 로드할 데이터가 없을 경우
                    return const Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('더이상 가져올 정보가 없습니다.'),
                        ],
                      ),
                    );
                  }
                },
                childCount: recruits.value.length + (hasMore.value ? 1 : 1),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(appBar: _appBar(), body: _body());
  }

  // JSON 데이터로부터 카드 위젯 리스트 생성
  List<Widget> createJobCardsFromJsonData(BuildContext context, List<Map<String, dynamic>> jsonData) {
    return jsonData.map((recruitData) {
      return jobVacancyCard(context, recruitData);
    }).toList();
  }

  Widget jobVacancyCard(BuildContext context, Map<String, dynamic> recruitData) {
    // 화면의 너비를 구합니다.
    double screenWidth = MediaQuery.of(context).size.width;
    Recruit recruit = Recruit.fromJson(recruitData);

    print("recruitData : ${recruitData}");
    print("jobVacancyCard : ${recruit}");

    // String url = recruitData['url'] ?? '';
    // String hash = recruitData['hash'] ?? '';
    // String title = recruitData['title'] ?? '';
    // String provider = recruitData['provider'] ?? '';
    // String company = recruitData['company_name'] ?? '';
    // String company_image = recruitData['company_image'] ?? '';
    // String expires_at = recruitData['expires_at'] ?? '';
    DecorationImage assets_logo_image = DecorationImage(image: AssetImage('${providerLogoPath}${recruit.provider}_logo.png'));
    NetworkImage network_logo_image = NetworkImage(recruit.company_image);

    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SimpleWebView(
                  url: recruit.url,
                )));
      },
      child: Container(
        width: double.infinity,
        height: 92,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              //color: CustomColors.black10, // 테두리 색상
              color: Colors.black12,
              width: 1.0, // 테두리 두께
            ),
          ),
          // 추가적인 스타일링이 필요한 경우 여기에 추가
        ),
        // 여백을 줘서 전체 너비의 90%만큼의 너비를 갖도록 설정합니다.
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        // 양쪽 마진을 각각 5%씩 줍니다.
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                  image: network_logo_image.url.isEmpty || recruit.company_image.isEmpty
                      ? assets_logo_image
                      : DecorationImage(
                          image: network_logo_image,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11.0),
                    child: Text(
                      recruit.title,
                      overflow: TextOverflow.ellipsis, // 화면을 벗어날 경우 ellipsis 처리
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 11.0, top: 6.0),
                    child: Text(
                      recruit.company_name,
                    ),
                    //child: AutoSizeText(company, minFontSize: 1, maxLines: 2, style: CustomTextStyles.footnote.textColor(Colors.grey)),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
