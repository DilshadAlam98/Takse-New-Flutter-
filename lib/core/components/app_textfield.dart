import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.prefix,
    this.maxLines = 1,
    this.minLine = 1,
    this.textInputType,
    this.maxLength,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.lengthLimit,
    this.suffix,
    this.obscureText = false,
  });

  final Function(String val)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? val)? validator;
  final String? labelText;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final int? lengthLimit;
  final int minLine;
  final TextInputType? textInputType;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      inputFormatters: [LengthLimitingTextInputFormatter(lengthLimit)],
      style: AppTextStyle.title.large.semiBold,
      onChanged: onChanged,
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      autofocus: autoFocus,
      controller: controller,
      maxLines: maxLines,
      minLines: minLine,
      validator: validator,
      maxLength: maxLength,
      cursorColor: AppColors.deepYellow,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: true,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        prefixIconConstraints: const BoxConstraints(maxHeight: 50, maxWidth: 80, minHeight: 20, minWidth: 20),
        counter: const SizedBox.shrink(),
        enabled: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.deepYellow, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.deepYellow, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.deepYellow, width: 1.5),
        ),
        errorStyle: AppTextStyle.title.medium.red.regular.zeroLineHeight,
        labelStyle: AppTextStyle.title.large.regular,
        hintStyle: AppTextStyle.title.large.regular,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
