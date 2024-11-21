import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) return const SizedBox();
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image!,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
