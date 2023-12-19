import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCard extends HookConsumerWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function()? onPressed;

  const CustomCard({
    super.key,
    this.margin,
    this.padding,
    this.onPressed,
    required this.child,
  });

  @override
  build(context, ref) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      margin: margin ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(86, 108, 158, 0.15),
            blurRadius: 40.0,
            offset: Offset(-5.0, 6.0),
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: padding ?? const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    );
  }
}
