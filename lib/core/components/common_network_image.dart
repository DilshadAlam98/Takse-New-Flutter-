import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takse/core/local/local_const.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({super.key, this.image, this.fit = BoxFit.cover});

  final String? image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (image == null) return const SizedBox();
    return CachedNetworkImage(
      fit: fit,
      imageUrl: LocalConst.localImgUrl + image!,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
