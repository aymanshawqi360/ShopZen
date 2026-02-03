import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/Shared/widget/auth/slide_and_fade_auth.dart';
import 'package:shopzen/core/common_ui/widgets/circle_avatar_positioned.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/feature/auth/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/back_button_screen.dart';
import 'package:shopzen/feature/auth/presentation/widget/resend_otp/resend_otp_body.dart';

class ResendOtpScreen extends StatelessWidget {
  const ResendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<ResendOtpCubit>(),
          child: Stack(
            children: [
              const CircleAvatarPositioned(),
              const BackButtonScreen(),
              const SlideAndFadeAuth(child: ResendOtpBody()),
            ],
          ),
        ),
      ),
    );
  }
}
