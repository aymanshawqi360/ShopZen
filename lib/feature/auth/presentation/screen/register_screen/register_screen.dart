import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/anumation_register.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<RegisterCubit>(),
        child: SafeArea(
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
             const AnimationRegister(),
            ],
          ),
        ),
      ),
    );
  }
}



