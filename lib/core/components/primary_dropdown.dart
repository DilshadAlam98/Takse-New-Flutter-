import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constant/asset_const.dart';
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
        prefix: Icon(Icons.add),
        border: !enableBorder ? InputBorder.none : null,
        enabled: true,
        fillColor: fillColor ?? AppColors.white,
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

class CommonDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;

  final T? selected;
  final Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final void Function(bool)? onMenuStateChange;
  final TextEditingController? searchController;
  final String? hint;
  final String? disableHint;
  final Color? fillColor;
  final bool enableSearch;
  final Widget? prefix;
  final bool enable;

  const CommonDropdown({
    super.key,
    required this.items,
    this.selected,
    this.onChanged,
    this.validator,
    this.onMenuStateChange,
    this.searchController,
    this.hint,
    this.disableHint,
    this.fillColor,
    this.enableSearch = false,
    this.prefix,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        isDense: true,

        style: AppTextStyle.title.medium.ellipsis,
        hint: Text(
          hint ?? "",
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items,
        value: selected,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          enabled: enable,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
          prefixIcon: Container(
            width: 30,
            height: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(AssetConst.rectangleTextfield),
              ),
            ),
            child: prefix,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
          ),
          errorStyle: AppTextStyle.title.medium.regular.red,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1.5, color: AppColors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1.5, color: AppColors.deepYellow),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          // Add more decoration..
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 300,
        ),
        // menuItemStyleData: const MenuItemStyleData(
        //   height: 40,
        // ),
        dropdownSearchData: enableSearch
            ? DropdownSearchData(
                searchController: searchController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: searchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search..',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().contains(searchValue);
                },
              )
            : null,
        onMenuStateChange: onMenuStateChange,
      ),
    );
  }
}
