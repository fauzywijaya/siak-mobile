import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// --------------
/// Constant Color
/// --------------
Color bluePrimary = const Color(0xff242498);
Color blueSecondary = const Color(0xff1E1EBE);
Color whitePrimary = const Color(0xffffffff);
Color whiteSecondary = const Color(0xffFAFAFC);
Color grayText = const Color(0xff8D92A3);
Color blackPrimary = const Color(0xff121212);
Color grayPrimary = const Color(0xffE2E2E2);
Color graySecondary = const Color(0xffCBCCD0);
Color yellowPrimary = const Color(0xffE8B100);
Color cyanPrimary = const Color(0xff38A3A5);

const kAnimationDuration = Duration(milliseconds: 200);

/// --------------
/// Asset Location
/// --------------
/// Example: ${iconAsset}/logo.svg
String iconAsset = "assets/icons";
String imageAsset = "assets/images";
String animationAsset = "assets/animations";

/// ------------
/// Device Size
/// ------------
double get deviceWidth => ScreenUtil().screenWidth;
double get deviceHeight => ScreenUtil().screenHeight;

/// --------------
/// Device OS
/// --------------
String? get getDeviceOS => Platform.isAndroid
    ? "android"
    : Platform.isIOS
        ? "ios"
        : null;

MaterialColor primaryCustomSwatch = MaterialColor(0xffFBBD1C, {
  50: bluePrimary,
  100: bluePrimary,
  300: bluePrimary,
  400: bluePrimary,
  500: bluePrimary,
  200: bluePrimary,
  600: bluePrimary,
  700: bluePrimary,
  800: bluePrimary,
  900: bluePrimary,
});

// MaterialColor primaryCustomSwatchDark = MaterialColor(0xffFBBD1C, {
//   50: blackColor,
//   100: blackColor,
//   200: blackColor,
//   300: blackColor,
//   400: blackColor,
//   500: blackColor,
//   600: blackColor,
//   700: blackColor,
//   800: blackColor,
//   900: blackColor,
// });

/// --------------
/// Status Bar Color
/// --------------
void setStatusBar({
  Brightness brightness = Brightness.dark,
  Color color = Colors.transparent,
}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color,
    statusBarBrightness: brightness,
    statusBarIconBrightness: brightness,
  ));
}

/// -----------------------------------
/// Font and size scaling screen utils
/// -----------------------------------
/// Initialize screen util and set default size
/// by device size
void setupScreenUtil(BuildContext context) {
  double baseWidth = MediaQuery.of(context).size.width;
  double baseHeight = MediaQuery.of(context).size.height;
  double defaultScreenUtilWidth = 1080;
  double defaultScreenUtilHeight = 1920;
  double iPadPro12InchWidth = 2048;
  double iPadPro12InchHeight = 2732;
  double designWidth = 0;
  double designHeight = 0;

  /// ipad 11-inch width: 834, height: 1194
  /// ipad 9-inch width: 768, height: 1024
  if (baseWidth >= 768) {
    designWidth = iPadPro12InchWidth;
  } else {
    designWidth = defaultScreenUtilWidth;
  }

  if (baseHeight >= 1024) {
    designHeight = iPadPro12InchHeight;
  } else {
    designHeight = defaultScreenUtilHeight;
  }

  ScreenUtil.init(
    context,
    designSize: Size(designWidth, designHeight),
  );
}

bool isSmallPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height < 700 ? true : false;
bool isReallySmallPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height < 600 ? true : false;
bool isBigPhoneHeight(BuildContext context) =>
    MediaQuery.of(context).size.height > 1200 ? true : false;

/// Setting height and width
double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);

/// Setting fontsize
double setFontSize(double size) => size.sp;

/// -----------------------------------
/// Constant Base Text Styling
/// -----------------------------------

TextStyle styleTitle = TextStyle(
  fontSize: setFontSize(36),
  color: blackPrimary,
  fontWeight: FontWeight.w700,
);

TextStyle styleSubtitle = TextStyle(
  fontSize: setFontSize(32),
  color: blackPrimary,
);
