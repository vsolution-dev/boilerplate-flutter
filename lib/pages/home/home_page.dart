import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_app_bar.dart';
import 'package:flutter_app/components/custom_scaffold.dart';
import 'package:flutter_app/extensions/build_context_extension.dart';
import 'package:flutter_app/styles/custom_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  build(context, ref) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: CustomIcons.logo,
      ),
      floatingActionButton: !kDebugMode
          ? null
          : FloatingActionButton(
              shape: CircleBorder(),
              child: Icon(Icons.developer_mode),
              onPressed: () {
                context.router.go('/debug');
              },
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
