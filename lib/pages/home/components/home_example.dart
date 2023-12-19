import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeExample extends HookConsumerWidget {
  const HomeExample({
    super.key,
  });

  @override
  build(context, ref) {
    return ElevatedButton(
      onPressed: () {
        // GoRouter.of(context).go('/posts/1');
        // PostOneRoute(postId: '1').go(context);
      },
      child: const Text('HomeExample'),
    );
  }
}
