import 'package:flutter/material.dart';

class FontFamilyManager {
  static const String alata = "alata";
  static const String overLock = "overlock";
  static const String overpass = "overpass";
  static const String ovo = "ovo";
}

class FontWeightManager {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
}

class FontSizeManager {
  static const double s12 = 12.0;
  static const double s13 = 13.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
}
class FontStyleManager {
  static TextStyle getAlataRegular({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.alata,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.regular);

  static TextStyle getOverLockRegular({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.overLock,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.regular);

  static TextStyle getOverLockBold({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.overLock,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.bold);

  static TextStyle getOverPassRegular({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.overpass,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.regular);

  static TextStyle getOverPassSemiBold({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.overpass,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.semiBold);

  static TextStyle getOverPassBold({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.overpass,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.bold);

  static TextStyle getOvoRegular({
    Color? color,
    double? fontSize,
  }) =>
      TextStyle(
          fontFamily: FontFamilyManager.ovo,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeightManager.regular);
}
