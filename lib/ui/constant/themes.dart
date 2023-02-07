import 'package:flutter/material.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: bluePrimary,
  primarySwatch: primaryCustomSwatch,
  brightness: Brightness.light,
  fontFamily: FontFamily.nunitoSans,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(0),
  ),
  scaffoldBackgroundColor: whiteSecondary,
  backgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: blackPrimary,
    displayColor: blackPrimary,
  ),
  colorScheme: const ColorScheme.light()
      .copyWith(
        primary: bluePrimary,
        onPrimary: bluePrimary,
      )
      .copyWith(
        primary: bluePrimary,
        secondary: bluePrimary,
        brightness: Brightness.light,
      ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: bluePrimary,
  ),
);
