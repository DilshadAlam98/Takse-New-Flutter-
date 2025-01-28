import 'package:flutter/material.dart';

import '../../../core/components/app_divider.dart';
import '../../../core/components/primary_button.dart';
import '../../../core/theme/app_text_style.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.message,
    required this.header,
    required this.onConfirm,
    required this.confirmText,
    this.child,
    this.secondaryButton,
    this.btnColor,
    this.headerStyle,
    this.messageStyle,
    this.btnTextStyle,
    this.asset,
  });

  final String header;
  final String message;
  final VoidCallback onConfirm;
  final String confirmText;
  final Widget? child;
  final Widget? secondaryButton;
  final Color? btnColor;
  final TextStyle? headerStyle;
  final TextStyle? messageStyle;
  final TextStyle? btnTextStyle;
  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (asset != null) ...[
              Image.asset(asset!, height: 40),
              const SizedBox(height: 15),
            ],
            Text(
              header,
              style: headerStyle ?? AppTextStyle.headline.large,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const AppDivider(),
            const SizedBox(height: 20),
            Text(message, style: messageStyle ?? AppTextStyle.title.large.regular),
            if (child != null) ...[
              const SizedBox(height: 20),
              child!,
            ],
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (secondaryButton != null) ...[
                  Flexible(child: secondaryButton ?? const SizedBox.shrink()),
                  const SizedBox(width: 20),
                ],
                Flexible(
                    child: PrimaryButton(
                  backgroundColor: btnColor,
                  borderColor: Colors.transparent,
                  textStyle: btnTextStyle,
                  onPressed: onConfirm,
                  text: confirmText,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
