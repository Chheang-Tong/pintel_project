import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DotDivider extends StatelessWidget {
  final Color color;
  const DotDivider({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: color,
      dashRadius: 0.0,
      dashGapLength: 2.0,
      dashGapRadius: 0.0,
    );
  }
}
