import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../core/core.dart';

class StagGrid extends StatelessWidget {
  const StagGrid({
    super.key,
    required this.length,
    this.limit = 4,
    required this.image,
  });

  final int length;
  final int limit;
  final List<String> image;

  @override
  Widget build(BuildContext context) {
    final int tileCount = length == 3
        ? (length - 1).clamp(0, limit)
        : length.clamp(0, limit);
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        if (length != 1)
          ...List.generate(
            tileCount,
            (index) => StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.black75,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      image[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (length == 1)
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                color: ColorResources.black75,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    image[0],
                  ),
                ),
              ),
            ),
          ),
        if (length == 3)
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                color: ColorResources.black75,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    image[2],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
