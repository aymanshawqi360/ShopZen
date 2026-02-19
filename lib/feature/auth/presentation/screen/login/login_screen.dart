import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:shopzen/core/Shared/widget/auth/slide_and_fade_auth.dart';
import 'package:shopzen/feature/auth/presentation/widget/login/body_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: Stack(
          children: [
            Positioned(
              top: AppSize.positionedTop140,
              right: AppSize.positionedRight95,
              child: CircleAvatar(
                radius: AppSize.radius170,
                backgroundColor: context.isDark()
                    ? AppColors.darkGray
                    : AppColors.lightGray,
              ),
            ),
            Padding(
              padding: AppSpacing.paddingL20R20B15,
              child: const SlideAndFadeAuth(child: BodyLogin()),
            ),
          ],
        ),
      ),
    );
  }
}
