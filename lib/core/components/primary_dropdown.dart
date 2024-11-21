import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class PrimaryDropdown<T> extends StatelessWidget {
  const PrimaryDropdown({
    super.key,
    this.selected,
    this.onChanged,
    required this.items,
    this.validator,
    this.hint = "Select",
    this.disableHint,
    this.fillColor,
    this.enableBorder = true,
  });

  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final String? hint;
  final String? disableHint;
  final Color? fillColor;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      isDense: true,
      isExpanded: true,
      focusColor: AppColors.deepYellow,
      value: selected,
      items: items,
      onChanged: onChanged,
      disabledHint: Text(
        disableHint ?? "No data available",
        style: AppTextStyle.title.small,
      ),
      iconEnabledColor: AppColors.deepYellow,
      autofocus: false,
      style: AppTextStyle.title.large.bold,
      decoration: InputDecoration(
        border: !enableBorder ? InputBorder.none : null,
        enabled: true,
        fillColor: fillColor ?? AppColors.white300,
        filled: true,
        alignLabelWithHint: true,
        isDense: true,
        hintText: hint,
        hintStyle: AppTextStyle.title.large.regular.zeroLineHeight,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        focusedErrorBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
              )
            : null,
        errorStyle: AppTextStyle.body.small.lightWeight.red.italic,
        errorBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
              )
            : null,
        focusedBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
              )
            : null,
        disabledBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: AppColors.grey),
              )
            : null,
        enabledBorder: enableBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
              )
            : null,
      ),
    );
  }
}
