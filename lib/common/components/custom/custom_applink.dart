import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AppLink extends StatelessWidget {
  final String title;
  final Widget leading;
  final Function() onTap;
  const AppLink({
    super.key,
    required this.onTap,
    required this.title,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorResources.black5,
            ),
            child: leading,
          ),
        ),
        Text(
          title,
          style: regularDefault.copyWith(
            color: ColorResources.black75,
          ),
        ),
      ],
    );
  }
}
