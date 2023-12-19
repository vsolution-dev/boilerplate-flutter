import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAvatar extends HookConsumerWidget {
  const CustomAvatar({
    super.key,
  });

  @override
  Widget build(context, ref) {
    return ElevatedButton(
      onPressed: () {
        // ...
      },
      child: const Text('Hello example'),
    );
  }
}
