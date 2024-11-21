import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key, required this.isLoading, required this.child, this.opacity = 0.3});

  final bool isLoading;
  final Widget child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 0.9,
      opacity: opacity,
      dismissible: false,
      inAsyncCall: isLoading,
      progressIndicator: SpinKitWave(
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: !index.isEven ? AppColors.deepYellow : AppColors.lightBlue,
            ),
          );
        },
      ),
      child: child,
    );
  }
}
