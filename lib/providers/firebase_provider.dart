import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_provider.g.dart';

@riverpod
FirebaseAnalytics firebaseAnalytics(FirebaseAnalyticsRef ref) {
  return FirebaseAnalytics.instance;
}

@riverpod
FirebaseCrashlytics firebaseCrashlytics(FirebaseCrashlyticsRef ref) {
  return FirebaseCrashlytics.instance;
}

@riverpod
Stream<String> firebaseMessaging(FirebaseMessagingRef ref) {
  final firebaseMessaging = FirebaseMessaging.instance;

  firebaseMessaging.requestPermission();

  return Stream<String>.multi((controller) async {
    await firebaseMessaging.requestPermission(provisional: true);
    await firebaseMessaging.getAPNSToken();

    final token = await firebaseMessaging.getToken();
    if (token != null) {
      controller.add(token);
    }

    firebaseMessaging.onTokenRefresh.listen((token) {
      controller.add(token);
    });
  });
}
