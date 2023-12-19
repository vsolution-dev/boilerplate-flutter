import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({
    super.key,
  });

  @override
  build(context, ref) {
    return CustomScaffold(
      body: Text('SettingPage'),
    );
  }
}
