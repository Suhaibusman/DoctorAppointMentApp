import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextWidget(
    {required String text,
    overflow = TextOverflow.visible,
    double fontSize = 12,
    int? maxLines,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    double? lineHeight}) {
  return AutoSizeText(
    text,
    overflow: overflow,
    textAlign: textAlign,
    maxLines: maxLines ?? 10,
    presetFontSizes: [fontSize, fontSize - 2, fontSize - 3, fontSize - 4],
    style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight ?? 1.4,
        color: color),
  );
}
