import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SeeMoreText extends StatefulWidget {
  final String text;
  final int trimLength;

  const SeeMoreText({
    super.key,
    required this.text,
    this.trimLength = 50,
  });

  @override
  State<SeeMoreText> createState() => _SeeMoreTextState();
}

class _SeeMoreTextState extends State<SeeMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLong = widget.text.length > widget.trimLength;
    final String visibleText = _isExpanded || !isLong
        ? widget.text
        : '${widget.text.substring(0, widget.trimLength)}... ';

    return RichText(
      text: TextSpan(
        style: regularDefault.copyWith(color: ColorResources.blackColor),
        children: [
          TextSpan(text: visibleText),
          if (isLong)
            TextSpan(
              text: _isExpanded ? '' : 'See more',
              style: semiBoldDefault,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() => _isExpanded = !_isExpanded);
                },
            ),
        ],
      ),
    );
  }
}
