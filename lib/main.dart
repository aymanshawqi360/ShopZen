import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopzen/core/config/env_config.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/shopzen_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(AppConstants.orientations);
 await EnvConfig.initializeEnvironment();
 await setupDependencies();
  runApp(const ShopzenApp());
}

