import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/build_context_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({
    super.key,
  });

  @override
  build(context, ref) {
    return Container(
      child: Column(
        children: [
          Text('로그인 폼'),
          ElevatedButton(
            onPressed: () {
              context.router.go('/home');
            },
            child: Text('입장'),
          ),
        ],
      ),
    );
  }
}
