import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextField extends HookConsumerWidget {
  final String? text;
  final String? errorText;
  final String? hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.text,
    this.errorText,
    this.hintText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  build(context, ref) {
    final controller = useTextEditingController(text: text);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        prefix: prefix,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
