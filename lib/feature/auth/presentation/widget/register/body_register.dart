import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_Info_column.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_already_have_account.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_bloc_lisener.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_form_screen.dart';

class BodyRegister extends StatelessWidget {
  const BodyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: AppSpacing.paddingL20R20,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: RegisterInfoColumn()),
              const SliverToBoxAdapter(child: RegisterFormScreen()),
              const SliverToBoxAdapter(child: RegisterAlreadyHaveAccount()),
              const SliverToBoxAdapter(child: RegisterBlocLisener()),
            ],
          ),
        );
  }
}