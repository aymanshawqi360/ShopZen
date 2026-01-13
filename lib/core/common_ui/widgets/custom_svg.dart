import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgAsset;
  final String svgNetworkUrl;
  // final Color? svgColor;
  final double svgHeight;
  final double svgWidth;

  const CustomSvg({
    super.key,
    this.svgAsset = '',
    this.svgHeight = 0,
    this.svgWidth = 0,
    this.svgNetworkUrl = '',
    // this.svgColor ,
  });

  @override
  Widget build(BuildContext context) {
    // final ColorFilter colorFilter = ColorFilter.mode(svgColor?? Colors.transparent, BlendMode.srcIn);
    if (svgAsset.isNotEmpty) {
      return SvgPicture.asset(
        svgAsset,
        // colorFilter: colorFilter,
        height: svgHeight,
        width: svgWidth,
      );
    } else if (svgNetworkUrl.isNotEmpty) {
      return SvgPicture.network(
        svgNetworkUrl,
        // colorFilter: colorFilter,
        height: svgHeight,
        width: svgWidth,
      );
    } else {
      return const SizedBox();
    }
  }
}
