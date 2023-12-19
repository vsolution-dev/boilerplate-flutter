import 'package:flutter/material.dart';
import 'package:flutter_app/styles/custom_text_styles.dart';

abstract class CustomTexts {
  static Text largeTitle(text) {
    return Text(text, style: CustomTextStyles.largeTitle);
  }

  static Text title1(text) {
    return Text(text, style: CustomTextStyles.title1);
  }

  static Text title2(text) {
    return Text(text, style: CustomTextStyles.title2);
  }

  static Text title3(text) {
    return Text(text, style: CustomTextStyles.title3);
  }

  static Text headline(text) {
    return Text(text, style: CustomTextStyles.headline);
  }

  static Text subheadline(text) {
    return Text(text, style: CustomTextStyles.subheadline);
  }

  static Text body(text) {
    return Text(text, style: CustomTextStyles.body);
  }

  static Text body2(text) {
    return Text(text, style: CustomTextStyles.body2);
  }

  static Text callout(text) {
    return Text(text, style: CustomTextStyles.callout);
  }

  static Text caption1(text) {
    return Text(text, style: CustomTextStyles.caption1);
  }

  static Text caption2(text) {
    return Text(text, style: CustomTextStyles.caption2);
  }

  static Text footnote(text) {
    return Text(text, style: CustomTextStyles.footnote);
  }
}
