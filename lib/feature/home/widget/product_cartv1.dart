import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/core.dart';


class ProductCartV1 extends StatefulWidget {
  const ProductCartV1({
    super.key,
    required this.name,
    required this.image,
    required this.percendiscount,
    required this.pricediscount,
  });
  final String name, image;
  final double percendiscount, pricediscount;

  @override
  State<ProductCartV1> createState() => _ProductCartV1State();
}

class _ProductCartV1State extends State<ProductCartV1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(4),
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: ColorResources.white45,
        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            height: size.height * 0.124,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (widget.percendiscount != 0.0 || widget.pricediscount != 0.0)
                  Positioned(
                    top: -6,
                    left: -6,
                    child: Container(
                      alignment: Alignment.center,
                      width: 39,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.defaultRadius),
                        color: ColorResources.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          widget.pricediscount != 0.0
                              ? '${widget.pricediscount} \$'
                              : '${widget.percendiscount.toInt()}%',
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
                    padding: EdgeInsets.all(Dimensions.smallRadius),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.defaultRadius),
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
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.mediumPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
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
                    bottom: Dimensions.mediumMagin,
                    right: Dimensions.mediumMagin,
                  ),
                  padding: EdgeInsets.all(Dimensions.smallPadding),
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
