import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class ErrorPage extends HookConsumerWidget {
  final Exception error;

  const ErrorPage({
    super.key,
    required this.error,
  });

  @override
  build(context, ref) {
    print(error);

    return Scaffold(
      body: Text(error.toString()),
    );
  }
}
