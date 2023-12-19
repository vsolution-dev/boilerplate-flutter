import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading.g.dart';

enum LoadingVariant {
  overlay,
  progress,
}

@riverpod
class Loading extends _$Loading {
  @override
  LoadingVariant? build() {
    return null;
  }

  start([variant = LoadingVariant.progress]) {
    state = variant;
  }

  finish() {
    state = null;
  }
}
