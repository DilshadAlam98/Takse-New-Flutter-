import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.thickness = 1.5, this.height = 0, this.endIndent, this.indent});

  final Color? color;
  final double? thickness;
  final double? height;
  final double? endIndent;
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Divider(
        endIndent: endIndent,
        indent: indent,
        color: color ?? AppColors.deepYellow,
        thickness: thickness,
        height: height,
      ),
    );
  }
}
