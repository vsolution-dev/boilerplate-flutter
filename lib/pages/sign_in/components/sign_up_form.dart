import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({
    super.key,
  });

  @override
  build(context, ref) {
    return Container(
      child: Text('회원가입 폼'),
    );
  }
}
