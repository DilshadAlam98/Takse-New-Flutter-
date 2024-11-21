import 'package:flutter/material.dart';
import 'package:takse/core/constant/global_const.dart';
import 'package:takse/core/theme/app_colors.dart';

import '../../src/utils/app_dialog.dart';
import '../components/common_error_view.dart';

class RenderViews extends StatefulWidget {
  const RenderViews({
    super.key,
    required this.apiState,
    this.onRetry,
    this.onDataNotFound,
    required this.errorMsg,
    this.emptyData = false,
    this.onPullRefresh,
    this.showError = true,
    required this.child,
  });

  final Widget child;
  final ApiState? apiState;
  final VoidCallback? onRetry;
  final VoidCallback? onDataNotFound;
  final String? errorMsg;
  final bool emptyData;
  final Function()? onPullRefresh;
  final bool showError;

  @override
  State<RenderViews> createState() => _RenderViewsState();
}

class _RenderViewsState extends State<RenderViews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RenderViews oldWidget) {
    super.didUpdateWidget(oldWidget);
    _determineLoader();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _determineLoader();
  }

  void _determineLoader() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.apiState == ApiState.loading && mounted) {
        AppDialog.showLoader();
      } else {
        AppDialog.hideLoader();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.apiState == ApiState.error && widget.showError) {
      return CommonErrorView(message: widget.errorMsg, onRetry: widget.onRetry);
    } else if (widget.apiState == ApiState.loaded && widget.emptyData) {
      return DataNotFound(onRetry: widget.onDataNotFound);
    }
    /* else if (widget.apiState == ApiState.loading) {
      return AppLoader(
        isLoading: true,
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget.child,
          ],
        ),
      );
    }*/
    // else if (widget.apiState == ApiState.idle) {
    //   return const SizedBox.shrink();
    // }
    return RefreshIndicator(
      backgroundColor: AppColors.deepYellow,
      color: Colors.white,
      onRefresh: () async {
        Future.value(widget.onPullRefresh?.call());
      },
      child: widget.child,
    );
  }
}
