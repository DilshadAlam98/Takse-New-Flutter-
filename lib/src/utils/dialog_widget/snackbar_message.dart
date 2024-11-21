import 'package:flutter/material.dart';

import '../../../core/theme/app_text_style.dart';

class SnackBarMessage extends StatelessWidget {
  const SnackBarMessage({super.key, required this.message, this.header});

  final String? header;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header ?? "Error",
          textAlign: TextAlign.center,
          style: AppTextStyle.display.medium.black,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(message, style: AppTextStyle.title.large.black)
      ],
    );
  }
}
