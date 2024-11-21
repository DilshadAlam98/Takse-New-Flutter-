import 'package:flutter/material.dart';
import 'package:takse/core/theme/app_colors.dart';

import '../theme/app_text_style.dart';

class CommonErrorView extends StatelessWidget {
  const CommonErrorView({super.key, required this.message, this.onRetry});

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xffFFCCCB).withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: const Color(0xffFFCCCB).withOpacity(0.7)),
              ],
            ),
            child: Column(
              children: [
                const Icon(Icons.error_rounded, size: 40, color: Colors.red),
                const SizedBox(height: 12),
                Text(
                  message ?? "Something Went Wrong",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 10),
            TextButton.icon(
              icon: const Icon(Icons.refresh, color: Colors.white),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.deepYellow,
                fixedSize: const Size(130, 35),
              ),
              onPressed: onRetry,
              label: Text(
                "Try Again",
                style: AppTextStyle.title.medium.white,
              ),
            )
          ]
        ],
      ),
    );
  }
}

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key, this.message, this.onRetry});

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(color: const Color(0xffFFCCCB).withOpacity(0.7)),
              ],
            ),
            child: Text(
              message ?? "No Data Found",
              style: AppTextStyle.title.medium.black.italic,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 10),
            TextButton.icon(
              icon: const Icon(Icons.refresh, color: Colors.white),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.deepYellow,
                fixedSize: const Size(130, 35),
              ),
              onPressed: onRetry,
              label: Text(
                "Try Again",
                style: AppTextStyle.title.medium.white,
              ),
            )
          ]
        ],
      ),
    );
  }
}
