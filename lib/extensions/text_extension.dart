import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

extension TextExtension on Text {
  // text-decoration
  Text underline() => textDecoration(TextDecoration.underline);
  Text overline() => textDecoration(TextDecoration.overline);
  Text lineThrough() => textDecoration(TextDecoration.lineThrough);

  Text textDecoration(TextDecoration decoration) {
    final style = this.style ?? const TextStyle();

    return _copyStyleWith(style.copyWith(decoration: decoration));
  }

  // font-family
  Text poppins() => _copyStyleWith(GoogleFonts.poppins());

  // font-weight
  Text fontThin() => fontWeight(FontWeight.w100);
  Text fontExtraLight() => fontWeight(FontWeight.w200);
  Text fontUltraLight() => fontWeight(FontWeight.w200);
  Text fontLight() => fontWeight(FontWeight.w300);
  Text fontRegular() => fontWeight(FontWeight.w400);
  Text fontNormal() => fontWeight(FontWeight.w400);
  Text fontMedium() => fontWeight(FontWeight.w500);
  Text fontSemiBold() => fontWeight(FontWeight.w600);
  Text fontDemiBold() => fontWeight(FontWeight.w600);
  Text fontBold() => fontWeight(FontWeight.w700);
  Text fontExtraBold() => fontWeight(FontWeight.w800);
  Text fontUltraBold() => fontWeight(FontWeight.w800);
  Text fontBlack() => fontWeight(FontWeight.w900);
  Text fontHeavy() => fontWeight(FontWeight.w900);

  Text fontWeight(FontWeight fontWeight) {
    final style = this.style ?? const TextStyle();

    return _copyStyleWith(style.copyWith(fontWeight: fontWeight));
  }

  // font-style
  Text italic() => fontStyle(FontStyle.italic);

  Text fontStyle(FontStyle fontStyle) {
    final style = this.style ?? const TextStyle();

    return _copyStyleWith(style.copyWith(fontStyle: fontStyle));
  }

  // color
  Text white() => color(Colors.white);
  Text black() => color(Colors.black);
  Text red() => color(Colors.red);
  Text blue() => color(Colors.blue);
  Text green() => color(Colors.green);

  Text color(Color color) {
    final style = this.style ?? const TextStyle();

    return _copyStyleWith(style.copyWith(color: color));
  }

  // text-align
  Text textLeft() => textAlign(TextAlign.left);
  Text textCenter() => textAlign(TextAlign.center);
  Text textRight() => textAlign(TextAlign.right);
  Text textJustify() => textAlign(TextAlign.justify);
  Text textStart() => textAlign(TextAlign.start);
  Text textEnd() => textAlign(TextAlign.end);

  Text textAlign(TextAlign textAlign) {
    return _copyWith(
      textAlign: textAlign,
    );
  }

  // text-overflow
  Text ellipsis() => _copyWith(overflow: TextOverflow.ellipsis, maxLines: 1, softWrap: false);
  Text overflow(TextOverflow overflow) => _copyWith(overflow: overflow, softWrap: false);

  // font-size
  Text extraSmall() => fontSize(12);
  Text small() => fontSize(14);
  Text large() => fontSize(18);
  Text extraLarge() => fontSize(20);

  Text fontSize(double fontSize) {
    final style = this.style ?? const TextStyle();

    return _copyStyleWith(style.copyWith(fontSize: fontSize));
  }

  Text _copyStyleWith(TextStyle? style) {
    return _copyWith(
      style: style ?? this.style,
    );
  }

  Text _copyWith({
    TextAlign? textAlign,
    TextStyle? style,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
  }) {
    return Text(
      data!,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    );
  }
}
