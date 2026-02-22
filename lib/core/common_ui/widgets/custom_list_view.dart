import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;

  final int itemCount;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  const CustomListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.scrollDirection,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: scrollDirection ?? Axis.horizontal,
      shrinkWrap: shrinkWrap ?? false,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }
}
