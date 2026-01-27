
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
}
