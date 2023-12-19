import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:flutter_app/extensions/build_context_extension.dart';
import 'package:flutter_app/helpers.dart';
import 'package:flutter_app/styles/custom_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends HookConsumerWidget {
  final Widget? title;
  final StatefulNavigationShell body;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
  });

  @override
  Widget build(context, ref) {
    return CustomScaffold(
      body: body,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _IconButton(
              isSelected: body.currentIndex == 0,
              onPressed: () => context.router.go('/home'),
              icon: CustomIcons.home,
            ),
            _IconButton(
              isSelected: body.currentIndex == 1,
              onPressed: () => context.router.go('/recruits'),
              icon: CustomIcons.finder,
            ),
            IconButton(
              onPressed: () async {
                final value = await showAlertWithIconBottomSheet(
                  icon: CustomIcons.lock,
                  title: '비밀번호 변경 실패 안내',
                  body: '파일을 업로드할 수 없습니다.\r\n파일 확장자 또는 파일 크기를 확인해주세요.',
                );

                print(value);
              },
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: context.colors.primary,
                foregroundColor: Colors.white,
              ),
            ),
            _IconButton(
              isSelected: body.currentIndex == 2,
              onPressed: () => context.router.go('/user'),
              icon: CustomIcons.user,
            ),
            _IconButton(
              isSelected: body.currentIndex == 3,
              onPressed: () => context.router.go('/setting'),
              icon: CustomIcons.dots_horizontal,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends HookConsumerWidget {
  final bool isSelected;
  final Widget icon;
  final Function() onPressed;

  const _IconButton({
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  build(context, ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(10),
            child: icon,
            decoration: !isSelected
                ? null
                : const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF2F5FF),
                  ),
          ),
        ),
        Positioned(
          bottom: -8,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: isSelected ? 1 : 0,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
