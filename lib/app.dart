import 'package:flutter/material.dart';
import 'package:flutter_app/apis/device_repository.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/navigators.dart';
import 'package:flutter_app/providers/firebase_provider.dart';
import 'package:flutter_app/providers/router_provider.dart';
import 'package:flutter_app/providers/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({
    super.key,
  });

  static BuildContext? get currentContext {
    return Navigators.currentContext;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAnalytics = ref.read(firebaseAnalyticsProvider);
    final firebaseMessaging = ref.watch(firebaseMessagingProvider);

    final deviceRepository = ref.read(deviceRepositoryProvider);

    final theme = ref.read(themeProvider);
    final router = ref.read(routerProvider);

    // firebaseMessaging.whenData((token) {
    //   deviceRepository.update(token);
    // });

    firebaseAnalytics.logAppOpen();

    return MaterialApp.router(
      title: Constants.APP_TITLE,

      // theme
      theme: theme,

      // router
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
