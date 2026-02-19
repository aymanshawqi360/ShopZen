import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/shopzen_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(AppConstants.orientations);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  await EnvConfig.initializeEnvironment();
  await setupDependencies();
  runApp(const ShopzenApp());
}
