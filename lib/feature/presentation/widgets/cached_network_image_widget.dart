import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final double? width;
  final double? height;

  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.borderRadius = 8,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => Image.asset('assets/images/no_image.jpg'),
      ),
    );
  }
}
