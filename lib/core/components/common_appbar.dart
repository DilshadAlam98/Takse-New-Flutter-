import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTile;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final double height;
  final Color? backgroundColor;
  final TextStyle? style;
  final dynamic Function(String value)? onSearch;
  final Widget? titleWidget;
  final Widget? flexibleSpace;

  const CommonAppBar({
    super.key,
    required this.title,
    this.leading,
    this.flexibleSpace,
    this.actions,
    this.centerTile = false,
    this.elevation = 8,
    this.bottom,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.style,
    this.onSearch,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      backgroundColor: backgroundColor,
      flexibleSpace: flexibleSpace,
      toolbarHeight: height,
      centerTitle: centerTile,
      elevation: elevation,
      leading: leading,
      title: titleWidget ??
          Text(
            title,
            style: style ?? AppTextStyle.headline.medium.lightBlack,
          ),
      actions: [
        ...?actions,
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  @override
  Size get preferredSize {
    if (bottom != null) {
      return const Size.fromHeight(kToolbarHeight * 1.8);
    } else {
      return const Size.fromHeight(kToolbarHeight);
    }
  }
}
