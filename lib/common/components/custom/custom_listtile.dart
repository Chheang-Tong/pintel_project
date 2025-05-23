import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Function()? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.onTap,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.vertical8),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.black5,
              ),
              child: widget.leading ??
                  SvgPicture.asset(
                    'assets/image/customize.svg',
                    width: 24,
                  ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: regularDefault.copyWith(
                      color: ColorResources.black75,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: mediumLarge,
                  ),
                ],
              ),
            ),
            if (widget.onTap != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
