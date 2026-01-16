import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgAsset;
  final String svgNetworkUrl;
  final ColorFilter? colorFilter;
  final double svgHeight;
  final double svgWidth;

  const CustomSvg({
    super.key,
    this.svgAsset = '',
    this.svgHeight = 0,
    this.svgWidth = 0,
    this.svgNetworkUrl = '',
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    if (svgAsset.isNotEmpty) {
      return SvgPicture.asset(
        svgAsset,
        colorFilter: colorFilter,
        height: svgHeight,
        width: svgWidth,
      );
    } else if (svgNetworkUrl.isNotEmpty) {
      return SvgPicture.network(
        svgNetworkUrl,
        colorFilter: colorFilter,
        height: svgHeight,
        width: svgWidth,
      );
    } else {
      return const SizedBox();
    }
  }
}
