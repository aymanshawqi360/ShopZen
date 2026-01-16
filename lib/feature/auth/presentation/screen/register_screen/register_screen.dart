import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_size.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/extension/app_extension.dart';
import 'package:shopzen/core/utils/app_color.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_Info_column.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_already_have_account.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_button.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_form_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(

          children:[
              Positioned(
            top: AppSize.positionedTop140,
            right: AppSize.positionedRight95,
            child: CircleAvatar(
              radius: AppSize.radius170,
              backgroundColor: 
              context.isDark()?AppColors.darkGray: AppColors.lightGray
            ),
          ),
             Padding(
            padding: AppSpacing.paddingL20R20,
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: RegisterInfoColumn()),
                const SliverToBoxAdapter(child: RegisterFormScreen()),
                const SliverToBoxAdapter(child: RegisterButton()),
                const SliverToBoxAdapter(child: RegisterAlreadyHaveAccount()),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}


 