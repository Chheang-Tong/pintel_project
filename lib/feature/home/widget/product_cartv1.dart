import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/core.dart';

class ProductCartV1 extends StatelessWidget {
  const ProductCartV1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(4),
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: ColorResources.whiteColor.withOpacity(0.45),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            height: size.height * 0.124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/image/image.png'),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -6,
                  left: -6,
                  child: Container(
                    alignment: Alignment.center,
                    width: 39,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorResources.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '15%',
                        style: regularDefault.copyWith(
                          color: ColorResources.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorResources.whiteColor.withOpacity(0.25),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_outline,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Waisted Jeans',
                  style: semiBoldLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '\$4.75',
                      style: semiBoldMediumLarge,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '\$6.00',
                      style: semiBoldLarge.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: ColorResources.black45,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorResources.black5,
                      ),
                      child: Text(
                        'In Stock',
                        style: semiBoldLarge,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorResources.black5,
                      ),
                      child: Text(
                        'New',
                        style: semiBoldLarge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                    right: 12,
                  ),
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorResources.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: 15,
                      color: ColorResources.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
