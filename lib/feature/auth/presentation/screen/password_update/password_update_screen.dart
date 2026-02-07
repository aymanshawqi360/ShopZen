import 'package:flutter/material.dart';
import 'package:shopzen/core/Shared/widget/auth/slide_and_fade_auth.dart';
import 'package:shopzen/core/common_ui/widgets/circle_avatar_positioned.dart';
import 'package:shopzen/feature/auth/presentation/widget/password_update/password_update_body.dart';

class PasswordUpdateScreen extends StatelessWidget {
  const PasswordUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Stack(
      fit: StackFit.expand,
      children: [
        const CircleAvatarPositioned(),
          const SlideAndFadeAuth(child: PasswordUpdateBody()),
        
      ],
    )));
  }
}