import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopzen/core/constants/app_assets.dart';
import 'package:shopzen/core/constants/app_constants.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_strings.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/routing/route_name.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/core/utils/font_weight_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animated = false;
  late Timer _timer;
  late Timer _timer2;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    initialization();
    _timer2 = Timer(Duration(seconds: 8), () {
      context.go(AppRoutes.login);
    });
  }

  void initialization() async {
    _timer = Timer(AppConstants.animatedOpacityDuration, () {
      setState(() {
        _animated = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark()
          ? AppColors.darkBackground
          : AppColors.blue850,

      body: Stack(
        children: [
          AnimatedPositioned(
            duration: AppConstants.animatedPositionedDuration,
            curve: Curves.easeOutBack,
            left: _animated ? 90 : -20.w,
            top: MediaQuery.of(context).size.height / 2 - 23,

            child: AnimatedOpacity(
              duration: AppConstants.animatedOpacityDuration,
              opacity: _animated ? 1 : 0,
              child: SvgPicture.asset(
                AppAssets.appLogo,
                width: 55.w,
                height: 55.h,
                fit: BoxFit.fill,
              ),
            ),
          ),

          AnimatedPositioned(
            duration: AppConstants.animatedPositionedDuration,
            curve: Curves.easeOutBack,
            right: _animated ? 80 : -80.w,

            top: MediaQuery.of(context).size.height / 2.1,
            child: AnimatedOpacity(
              duration: AppConstants.animatedOpacityDuration,
              opacity: _animated
                  ? AppConstants.opacityOne
                  : AppConstants.opacityZero,
              child: Text(
                AppConstants.shopZen,
                style: context.appTheme.textTheme.bodyLarge?.copyWith(
                  fontSize: AppSize.textSizeSp33,
                  fontWeight: FontWeightHelper.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: AppStrings.satoshiFont,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
