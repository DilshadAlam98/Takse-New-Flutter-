import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takse/core/theme/app_text_style.dart';

import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.backgroundColor,
    required this.text,
    required this.onPressed,
    this.height = 45,
    this.width,
    this.enable = true,
    this.icon,
    this.borderColor,
    this.textStyle,
    this.isLoading = false,
    this.borderRadius = 10,
    this.elevation = 4,
  });

  final IconData? icon;
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final double? width;
  final double height;
  final bool enable;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          disabledBackgroundColor: AppColors.grey,
          elevation: elevation,
          side: BorderSide(color: borderColor ?? AppColors.deepYellow),
          backgroundColor: backgroundColor ?? AppColors.deepYellow,
        ),
        onPressed: enable ? onPressed : null,
        child: getChild(),
      ),
    );
  }

  Widget getChild() {
    if (isLoading ?? false) {
      return Center(child: CupertinoActivityIndicator(color: AppColors.black, radius: 15));
    } else if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: AppColors.white),
          const SizedBox(width: 8),
          Text(
            text,
            style: textStyle ?? AppTextStyle.title.medium.semiBold,
          ),
        ],
      );
    } else {
      return Text(
        text,
        style: textStyle ?? AppTextStyle.title.large.black.bold,
      );
    }
  }
}
