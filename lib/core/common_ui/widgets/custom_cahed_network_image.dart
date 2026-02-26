import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCahedNetworkImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Widget placeholder;
  final BoxFit? fit;
  final Color? color;

  const CustomCahedNetworkImage({
    super.key,

    required this.image,
    this.width,
    this.fit,
    this.height,
    required this.placeholder,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      color: color,
      imageUrl: image,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) {
        return placeholder;
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error, color: Colors.red);
      },
    );
  }
}
