import 'package:flutter/material.dart';
import 'package:flutter_app/providers/loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomScaffold extends HookConsumerWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(context, ref) {
    final loading = ref.watch(loadingProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          body: SafeArea(
            child: body,
          ),
        ),
        if (loading == LoadingVariant.progress) //
          const SafeArea(
            child: LinearProgressIndicator(),
          ),
        if (loading == LoadingVariant.overlay) //
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
