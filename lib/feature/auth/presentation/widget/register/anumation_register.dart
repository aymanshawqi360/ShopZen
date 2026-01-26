import 'package:flutter/material.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_Info_column.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_already_have_account.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_bloc_lisener.dart';
import 'package:shopzen/feature/auth/presentation/widget/register/register_form_screen.dart';

class AnimationRegister extends StatefulWidget {
  const AnimationRegister({super.key});

  @override
  State<AnimationRegister> createState() => _AnimationRegisterState();
}

class _AnimationRegisterState extends State<AnimationRegister>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: AppSpacing.paddingL20R20,
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: RegisterInfoColumn()),
              const SliverToBoxAdapter(child: RegisterFormScreen()),
              const SliverToBoxAdapter(child: RegisterAlreadyHaveAccount()),
              const SliverToBoxAdapter(child: RegisterBlocLisener()),
            ],
          ),
        ),
      ),
    );
  }
}
