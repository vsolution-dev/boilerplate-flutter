import 'package:flutter/material.dart';

abstract class Navigators {
  Navigators._();

  static final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> userKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> recruitsKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> welcomeKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext {
    return rootKey.currentContext;
  }
}
