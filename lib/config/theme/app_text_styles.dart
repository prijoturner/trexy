import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Base font family
  static const String _fontFamily = 'Axiforma';

  // Thin - 100
  static TextStyle thin({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w100,
    fontSize: fontSize,
    color: color,
  );

  // Extra Light - 200
  static TextStyle extraLight({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w200,
    fontSize: fontSize,
    color: color,
  );

  // Light - 300
  static TextStyle light({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: fontSize,
    color: color,
  );

  // Regular - 400
  static TextStyle regular({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
    color: color,
  );

  // Medium - 500
  static TextStyle medium({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
    color: color,
  );

  // Semi Bold - 600
  static TextStyle semiBold({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    color: color,
  );

  // Bold - 700
  static TextStyle bold({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
    color: color,
  );

  // Extra Bold - 800
  static TextStyle extraBold({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: fontSize,
    color: color,
  );

  // Black - 900
  static TextStyle black({double? fontSize, Color? color}) => TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: fontSize,
    color: color,
  );
}
