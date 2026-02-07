import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/core/Shared/widget/auth/slide_and_fade_auth.dart';
import 'package:shopzen/core/common_ui/widgets/circle_avatar_positioned.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/feature/auth/presentation/cubit/verify_email_cubit/verify_email_cubit.dart';
import 'package:shopzen/feature/auth/presentation/widget/verify_email/verify_email_body.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: BlocProvider(
        create: (context) => sl<VerifyEmailCubit>(),
        child: Stack(
          children: [
            const CircleAvatarPositioned(),
            const SlideAndFadeAuth(child: VerifyEmailBody()),
          ],
        ),
      ),
    );
  }
}
