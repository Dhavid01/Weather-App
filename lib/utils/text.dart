import 'package:weather/core/constants/textstyle.dart';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool centered;
  final double? fontSize;
  final bool multitext;
  final TextOverflow? overflow;
  final Color? color;
  final int? maxlines;
  final double? height;
  final TextAlign? textAlign;

  /// this is heading 1 semi bold style, font size = 29, fontweight = 600.
  AppText.heading(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.fontSize,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading.copyWith(color: color, fontSize: fontSize),
        super(key: key);

  /// this is heading 1 Medium style, font size = 29, fontweight = 500.
  AppText.caption(
    this.text, {
    Key? key,
    this.overflow,
    this.fontSize,
    this.color,
    this.centered = true,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = caption.copyWith(color: color),
        super(key: key);

  /// this is heading 1 Regular style, font size = 29, fontweight = 400.
  AppText.headingMeduim(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.fontSize,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = headingMeduim.copyWith(color: color, fontSize: fontSize),
        super(key: key);

  /// this is heading 2 semi bold style, font size = 26, fontweight = 600.
  AppText.captionMedium(
    this.text, {
    Key? key,
    this.fontSize,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = captionMedium.copyWith(color: color),
        super(key: key);

  /// this is heading 2 Medium style, font size = 26, fontweight = 500.
  AppText.headingRegular(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.fontSize,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = headingRegular.copyWith(color: color),
        super(key: key);

  /// this is heading 2 Regular style, font size = 26, fontweight = 400.
  AppText.superScript(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.fontSize,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = superScript.copyWith(color: color, fontSize: fontSize),
        super(key: key);

  /// this is heading 3 semi bold style, font size = 23, fontweight = 600.
  AppText.buttonText(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.fontSize,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = buttonText.copyWith(color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(height: height),
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      maxLines: multitext || maxlines != null ? maxlines ?? 999999 : 1,
    );
  }
}
