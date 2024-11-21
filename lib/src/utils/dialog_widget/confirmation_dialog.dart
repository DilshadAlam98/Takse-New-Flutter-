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
  });

  final String header;
  final String message;
  final VoidCallback onConfirm;
  final String confirmText;
  final Widget? child;
  final Widget? secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(header, style: AppTextStyle.display.medium),
            const SizedBox(height: 20),
            const AppDivider(),
            const SizedBox(height: 20),
            Text(message, style: AppTextStyle.display.small),
            if (child != null) ...[
              const SizedBox(height: 20),
              child!,
            ],
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryButton(onPressed: onConfirm, text: confirmText),
                if (secondaryButton != null) ...[
                  const SizedBox(height: 20),
                  secondaryButton ?? const SizedBox.shrink(),
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
