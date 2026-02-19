import 'package:flutter/services.dart';

class AppConstants {
  AppConstants._();
  static const Size designSize = Size(375, 812);
  static const bool minTextAdapt = true;
  static const bool splitScreenMode = true;
  static const bool debugShowCheckedModeBanner = false;
  static const List<DeviceOrientation> orientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ];
  static const String countryCode = "YE";
  static const String phoneNumbeInput = "phone_number_input";

  //Durations
  static const Duration splachDuration = Duration(milliseconds: 500);
  static const Duration animatedPositionedDuration = Duration(seconds: 4);
  static const Duration animatedOpacityDuration = Duration(seconds: 3);
  static const double opacityZero = 0;
  static const double opacityOne = 1;

  //Splash
  static const String shopZen = "ShopZen";
}
