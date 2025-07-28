import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CachedNetworkImageWidget(
      {super.key,
        required this.imageUrl,
        required this.width,
        required this.height,
        this.fit = BoxFit.cover
      });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
