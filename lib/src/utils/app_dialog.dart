import 'package:flutter/material.dart';
import 'package:takse/src/utils/dialog_widget/topup_dialog.dart';

import '../../core/base/app_loader.dart';
import '../../core/base/navigation.dart';
import '../../core/theme/app_colors.dart';
import 'dialog_widget/confirmation_dialog.dart';
import 'dialog_widget/snackbar_message.dart';

class AppDialog {
  static void showErrorSnackBar({required String? message, String? header, Color? backgroundColor}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        clipBehavior: Clip.antiAlias,
        closeIconColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        backgroundColor: backgroundColor ?? AppColors.red,
        content: SnackBarMessage(message: message ?? "Something went wrong", header: header),
      ),
    );
  }

  static void showSuccessSnackBar({required String? message, String? header, Color? backgroundColor}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        clipBehavior: Clip.antiAlias,
        closeIconColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        backgroundColor: backgroundColor ?? AppColors.green,
        content: SnackBarMessage(message: message ?? "", header: "Success"),
      ),
    );
  }

  static void showConfirmation({
    required String message,
    required String header,
    required VoidCallback onConfirm,
    required String confirmText,
    Widget? secondaryBtn,
    bool barrierDismissible = true,
    Widget? child,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: navigatorKey.currentState!.context,
      builder: (context) => ConfirmationDialog(
        header: header,
        message: message,
        confirmText: confirmText,
        onConfirm: onConfirm,
        secondaryButton: secondaryBtn,
        child: child,
      ),
    );
  }

  static void showTopUpDialog({required Function(String amt) onProceed}) {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => TopUpDialog(onProceed: onProceed),
    );
  }

  static bool _isLoaderShowing = false;

  static showLoader() {
    if (_isLoaderShowing) {
      hideLoader();
    }
    _isLoaderShowing = true;
    return showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (context) => AppLoader(isLoading: _isLoaderShowing, opacity: 0, child: const SizedBox()),
    );
  }

  static hideLoader() {
    if (!_isLoaderShowing) {
      return;
    }
    _isLoaderShowing = false;
    return Navigator.pop(ctx);
  }

  static Future<String> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      confirmText: "Done",
      initialEntryMode: TimePickerEntryMode.input,
      onEntryModeChanged: (p0) {
        print("Mode---$p0");
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return picked?.format(context) ?? "";
  }
}
