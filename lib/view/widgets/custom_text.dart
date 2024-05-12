import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.title,
      required this.color,
      required this.fontSize,
      required this.overflow});
  final String title;
  final Color color;
  final double fontSize;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          overflow: overflow,
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: fontSize),
    );
  }
}
