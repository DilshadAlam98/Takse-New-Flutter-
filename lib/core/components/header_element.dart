import 'package:flutter/material.dart';
import 'package:takse/core/constant/asset_const.dart';
import 'package:takse/core/theme/app_text_style.dart';

class HeaderElement extends StatelessWidget {
  const HeaderElement({
    super.key,
    required this.header,
    this.imageHeight = 35,
    this.imageWidth = 35,
    this.headerStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final String header;
  final double imageHeight;
  final double imageWidth;
  final TextStyle? headerStyle;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Image.asset(
          AssetConst.chutki,
          height: imageHeight,
          width: imageWidth,
        ),
        const SizedBox(width: 10),
        Text(header, style: headerStyle ?? AppTextStyle.headline.large.black)
      ],
    );
  }
}
