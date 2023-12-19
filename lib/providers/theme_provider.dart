import 'package:flutter/material.dart';
import 'package:flutter_app/themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeData theme(ThemeRef ref) {
  return Themes.light;
}
