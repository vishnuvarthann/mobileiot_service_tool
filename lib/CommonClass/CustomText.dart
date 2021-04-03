import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color color;
  final TextAlign textAlign;
  const CustomText(
      {@required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.fontStyle,
      this.textAlign});
  @override
  Widget build(BuildContext context) {
        return Text(
          text,
          style:  TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Trajan Pro',
              fontStyle: FontStyle.italic,
              color: color),
      textAlign: textAlign,
    );
  }
}
