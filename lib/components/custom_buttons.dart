import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/text_extension.dart';
import 'package:flutter_app/styles/custom_colors.dart';
import 'package:flutter_app/styles/custom_texts.dart';

enum ButtonVariant { normal, success, error }

abstract class CustomButtons {
  CustomButtons._();

  static outlined(String label, {
    bool isDisabled = false,
    bool small = false,
    VoidCallback? onPressed,
  }) {
    var fontSize = 16.0;
    var height = 60.0;
    var lineHeight = 1.25;
    var borderRadius = BorderRadius.circular(12);

    if (small) {
      fontSize = 13.0;
      height = 40.0;
      lineHeight = 1.23;
      borderRadius = BorderRadius.circular(10);
    }

    if (isDisabled) {
      return filled(
        label,
        small: small,
        isDisabled: true,
      );
    }

    return OutlinedButton(
      onPressed: isDisabled ? null : () => {if (onPressed != null) onPressed()},
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        side: BorderSide(width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          height: lineHeight,
        ),
      ),
    );
  }

  static filled(String label, {
    bool isDisabled = false,
    bool small = false,
    foregroundColor = Colors.white,
    backgroundColor = CustomColors.blueBlack,
    ButtonVariant? variant = ButtonVariant.normal,
    Function? onPressed,
  }) {
    var fontSize = 16.0;
    var height = 60.0;
    var lineHeight = 1.25;
    var borderRadius = BorderRadius.circular(12);

    if (small) {
      fontSize = 13.0;
      height = 40.0;
      lineHeight = 1.23;
      borderRadius = BorderRadius.circular(10);
    }

    return FilledButton(
      onPressed: isDisabled ? null : () => {if (onPressed != null) onPressed()},
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      style: FilledButton.styleFrom(
        foregroundColor: switch (variant) {
          ButtonVariant.normal => Colors.white,
          ButtonVariant.success => CustomColors.success,
          ButtonVariant.error => CustomColors.error,
          null => foregroundColor,
        },
        backgroundColor: switch (variant) {
          ButtonVariant.normal => CustomColors.blueBlack,
          ButtonVariant.success => CustomColors.lightSuccess,
          ButtonVariant.error => CustomColors.lightError,
          null => backgroundColor,
        },
        disabledBackgroundColor: Color(0xFFE3E6EE),
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          height: lineHeight,
        ),
      ),
    );
  }

  static icon(Widget icon, {
    VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }

  static text(String text, {
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        enableFeedback: false,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: CustomTexts.body2(text).ellipsis().color(Color(0xff5E57FF)),
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: 4),
            SizedBox(
              height: 18,
              child: suffixIcon,
            ),
          ],
        ],
      ),
    );
  }
}
