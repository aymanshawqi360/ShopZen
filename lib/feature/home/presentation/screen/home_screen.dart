import 'package:flutter/material.dart';
import 'package:shopzen/core/common_ui/widgets/custom_appbar.dart';
import 'package:shopzen/feature/home/presentation/screen/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar(), body: const HomeBody());
  }
}
