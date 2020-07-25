import 'package:flutter/material.dart';

class ThemeColor {
  static const Color grayLight = Color(0xFFE9EBF0);
  static const Color red = Color(0xFFFE0000);
  static const Color black = Color(0xFF010E23);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayDark = Color(0xFFC8CCD5);
  static const Color text = Color(0xFFA0AAC0);
  static const Color frame = Color(0xFF5A6C94);
  static const BoxShadow shadow = BoxShadow(
    offset: Offset(0.0, 5.5),
    blurRadius: 30,
    color: Color.fromRGBO(0, 0, 0, .2)
  );
  static const BoxShadow shadowImage = BoxShadow(
    offset: Offset(0.0, 5.5),
    blurRadius: 30,
    color: Color.fromRGBO(0, 0, 0, .25)
  );
}