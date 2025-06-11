import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? lead;
  final Widget? action;
  const CustomAppBar({
    super.key,
    required this.title,
    this.lead,
    this.action,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            if (widget.lead != null) widget.lead!,
            Text(
              widget.title,
              style: boldOverLarge,
            ),
            const Spacer(),
            if (widget.action != null) widget.action!,
          ],
        ),
      ),
    );
  }
}
