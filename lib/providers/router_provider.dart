import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_scaffold.dart';
import 'package:flutter_app/navigators.dart';
import 'package:flutter_app/pages/debug/debug_page.dart';
import 'package:flutter_app/pages/error/error_page.dart';
import 'package:flutter_app/pages/home/home_page.dart';
import 'package:flutter_app/pages/recruit_list/recruit_list_page.dart';
import 'package:flutter_app/pages/setting/setting_page.dart';
import 'package:flutter_app/pages/sign_in/sign_in_page.dart';
import 'package:flutter_app/pages/user/user_page.dart';
import 'package:flutter_app/pages/user/user_profile_update_page.dart';
import 'package:flutter_app/pages/welcome/welcome_page.dart';
import 'package:flutter_app/providers/firebase_provider.dart';
import 'package:flutter_app/providers/session_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final firebaseAnalytics = ref.read(firebaseAnalyticsProvider);

  final session = ref.read(SessionNotifier.provider);

  return GoRouter(
    navigatorKey: Navigators.rootKey,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: Navigators.rootKey,
        pageBuilder: (context, state, body) {
          return MaterialPage(
            child: AppScaffold(body: body),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: Navigators.homeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Navigators.recruitsKey,
            routes: [
              GoRoute(
                path: '/recruits',
                builder: (context, state) {
                  return RecruitListPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Navigators.userKey,
            routes: [
              GoRoute(
                path: '/user',
                builder: (context, state) {
                  return const UserPage();
                },
              ),
              GoRoute(
                path: '/user/profile/update',
                builder: (context, state) {
                  return const UserProfileUpdatePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Navigators.settingKey,
            routes: [
              GoRoute(
                path: '/setting',
                builder: (context, state) {
                  return const SettingPage();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (context, state) => SignInPage(),
      ),
      if (kDebugMode)
        GoRoute(
          path: '/debug',
          builder: (context, state) => DebugPage(),
        ),
    ],
    initialLocation: '/home',
    refreshListenable: session,
    observers: [
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics),
    ],
    errorBuilder: (context, stackTrace) {
      return ErrorPage(error: stackTrace.error!);
    },
  );
}
