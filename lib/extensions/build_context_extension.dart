import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  GoRouter get router => GoRouter.of(this);

  ColorScheme get colors => theme.colorScheme;
}
