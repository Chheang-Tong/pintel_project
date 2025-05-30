import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/core.dart';

class CustomLoader extends StatelessWidget {
  final bool isFullScreen;
  final bool isPagination;
  final double strokeWidth;

  const CustomLoader(
      {super.key,
      this.isFullScreen = true,
      this.isPagination = false,
      this.strokeWidth = 1});

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? Center(
            child: SpinKitThreeBounce(
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ))
        : isPagination
            ? Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: LoadingIndicator(
                      strokeWidth: strokeWidth,
                    )))
            : Center(
                child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
                size: 20.0,
              ));
  }
}

class LoadingIndicator extends StatelessWidget {
  final double strokeWidth;
  const LoadingIndicator({super.key, this.strokeWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorResources.black10,
      ),
      child: const CircularProgressIndicator(
        color: ColorResources.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
