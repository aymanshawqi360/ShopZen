import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
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
            top: -140,
            right: -95,
            child: CircleAvatar(
              radius: 170,
              backgroundColor: 
               Color(0xff2A2A2A)
              // AppColors.griy950,
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


 