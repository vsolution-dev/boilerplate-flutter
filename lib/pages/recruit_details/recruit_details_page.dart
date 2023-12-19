import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecruitDetailsPage extends HookConsumerWidget {
  final String recruitId;

  const RecruitDetailsPage({
    super.key,
    required this.recruitId,
  });

  @override
  build(context, ref) {
    return CustomScaffold(
      body: Text('RecruitDetailsPage'),
    );
  }
}
