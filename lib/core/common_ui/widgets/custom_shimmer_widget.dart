import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopzen/core/extension/app_extension.dart';

class CustomShimmerWidget extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final bool? enabled;
  const CustomShimmerWidget({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: enabled ?? true,
      baseColor:
          baseColor ??
          (context.isDark() ? Colors.grey[900]! : Colors.grey[300]!),
      highlightColor:
          highlightColor ??
          (context.isDark() ? Colors.grey[800]! : Colors.grey[100]!),

      child: child,
    );
  }
}
