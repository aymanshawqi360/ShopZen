import 'package:flutter/widgets.dart';
import 'package:shopzen/core/common_ui/widgets/custom_arrow_back_button.dart';
import 'package:shopzen/core/constants/app_spacing.dart';
import 'package:shopzen/core/routing/route_name.dart';

class BackButtonScreen extends StatelessWidget {
  const BackButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingL24R24T15,
      child: const CustomArrowBackButton(location: AppRoutes.forgotPassword),
    );
  }
}
