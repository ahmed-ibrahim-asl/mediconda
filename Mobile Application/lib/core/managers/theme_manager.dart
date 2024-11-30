import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/font_style_manager.dart';
import 'package:mediconda/core/managers/size_manager.dart';

import 'color_manager.dart';

class ThemeManager{
  static  final OutlineInputBorder _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeManager.largeBorderRadius.r),
  );
  static const _fontFamily = FontFamilyManager.overpass;
  static final _colorScheme = ColorScheme.fromSeed(seedColor: ColorManager.primaryColor);
  static final _filledButtonStyle = FilledButtonThemeData(
      style: ButtonStyle(
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius.w))
          )
      )
  );
  static final _buttonStyle = ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius.r))

  );
  static final _elevatedStyle = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorManager.darkBlue),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.largeBorderRadius.r))
          )
      )
  );
  static final _inputStyle = InputDecorationTheme(
    border: _inputBorder,
    focusedBorder: _inputBorder,
    enabledBorder: _inputBorder,
    disabledBorder: _inputBorder,
  );
  static ThemeData lightTheme()=> ThemeData(
    colorScheme: _colorScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    filledButtonTheme: _filledButtonStyle,
    buttonTheme: _buttonStyle,
    elevatedButtonTheme: _elevatedStyle,
    inputDecorationTheme: _inputStyle,
  );
  static ThemeData darkTheme()=> ThemeData(
    colorScheme: _colorScheme,
    useMaterial3: true,
    fontFamily: _fontFamily,
    filledButtonTheme: _filledButtonStyle,
    buttonTheme: _buttonStyle,
    elevatedButtonTheme: _elevatedStyle,
    inputDecorationTheme: _inputStyle,

  );
}