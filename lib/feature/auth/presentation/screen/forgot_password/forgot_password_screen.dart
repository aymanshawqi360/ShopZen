import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/Shared/widget/auth/slide_and_fade_auth.dart';
import 'package:shopzen/core/common_ui/widgets/circle_avatar_positioned.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/feature/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/forgot_password/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: BlocProvider(
        create: (context) => sl<ForgotPasswordCubit>(),
        child: Stack(
          children: [
            const CircleAvatarPositioned(),
            const SlideAndFadeAuth(child: ForgotPasswordBody()),
          ],
        ),
      ),
    );
  }
}
