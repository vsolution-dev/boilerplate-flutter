# `pages` 경로

## `pages` 경로는 생산성을 위주로 작업하도록 합니다.

- 자료형(Type) 지정을 약하게 지정하여도 무난합니다.
  ```
  // 전
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Text("Post"),
    );
  }

  // 후
  @override
  build(context, ref) {
    return const Scaffold(
      body: Text("Post"),
    );
  }
  ```

## 명명규칙은 아래와 같이 작성합니다.

- 변수명은 최대한 전체적인 이름 그대로 넣습니다.
    - `temp_password` (X)
    - `temporary_password` (O)
- 목록은 `xxx_list_page` 형태로 지정합니다.
- 상세는 `xxx_details_page` 형태로 지정합니다.
- `pages` 아래에 바로 `.dart` 를 작성하지말고 경로를 만들어 `xxx_page.dart` 를 작성하도록 합니다.
- 만약 `xxx_page.dart` 의 코드가 길다고 느껴진다면 `components` 경로를 생성하고 주관적인 느낌대로 모듈을 생성하여 불러오도록 합니다.
    ```
    pages
        xxx
            components
                - yyy.dart
                - zzz.dart
            - xxx_page.dart
    ```

## 무조건 화면을 모두 작성한 후 상태관리를 작성합니다.

- 화면작성과 상태관리를 동시하지 않고 무조건 선 화면작성, 후 상태관리 순서로 작업합니다.
- 어느정도의 중복코드는 용인합니다.
  (기획이 변동될 때 마다 공통 함수를 한 곳 을 개선 하려다 오히려 함수의 복잡도만 늘어날 수 있으니 주의합니다.)

## 상태관리는 철저하게 작성합니다.

- `page` 내부 상태관리는 `useXXXX()`을 사용합니다.
- 다른 `page` 끼리 공유하는 상태관리는 `ref.read`, `ref.watch`, `ref.listen` 으로 상태관리 하도록 합니다.
    - `ref.read` : 단순 `provider` 접근할때 사용합니다.
    - `ref.watch` : `provider` 의 값이 변경되는 즉시 화면을 다시 그립니다.
    - `ref.listen` : `provider` 의 값이 변경되는 즏시 callback 함수를 호출합니다
- Repository 는 `apis` 경로에 작성 하도록 하고, 그 외 범용 상태관리, 비즈니스 로직들은 `providers` 경로 에서 관리합니다.