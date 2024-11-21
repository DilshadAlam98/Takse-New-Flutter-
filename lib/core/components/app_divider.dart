import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.thickness = 1.5, this.height = 0});

  final Color? color;
  final double? thickness;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? AppColors.deepYellow, thickness: thickness, height: height);
  }
}
