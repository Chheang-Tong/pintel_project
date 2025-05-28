import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ProductCartV2 extends StatefulWidget {
  const ProductCartV2({
    super.key,
    required this.name,
    required this.image,
    required this.percendiscount,
    required this.pricediscount,
    required this.onTap,
  });
  final String name, image;
  final double percendiscount, pricediscount;
  final Function onTap;
  @override
  State<ProductCartV2> createState() => _ProductCartV2State();
}

class _ProductCartV2State extends State<ProductCartV2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(Dimensions.defaultPadding),
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: ColorResources.white45,
        borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 0.129,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.defaultRadius),
                topRight: Radius.circular(Dimensions.defaultRadius),
              ),
              color: ColorResources.black45,
              image: DecorationImage(
                image: NetworkImage(
                  widget.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
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
              horizontal: Dimensions.defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(
                  widget.name,
                  style: mediumLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '\$4.75',
                      style: semiBoldMediumLarge,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '\$6.00',
                      style: mediumDefault.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: ColorResources.black45,
                      ),
                    ),
                    Spacer(),
                    if (widget.percendiscount != 0.0 ||
                        widget.pricediscount != 0.0)
                      Text(
                        widget.percendiscount != 0
                            ? '${widget.percendiscount.toInt()}% OFF'
                            : '${widget.pricediscount.toInt()}\$ OFF',
                        style: regularDefault.copyWith(
                          letterSpacing: 0.01,
                          color: ColorResources.errorColor,
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: 12,
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.smallRadius),
                        color: ColorResources.black5,
                      ),
                      child: Text(
                        'In Stock',
                        style: regularDefault.copyWith(letterSpacing: 0.01),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.smallRadius),
                        color: ColorResources.black5,
                      ),
                      child: Text(
                        'New',
                        style: regularDefault.copyWith(letterSpacing: 0.02),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => widget.onTap(),
                      child: SvgPicture.asset(
                        'assets/image/cart.svg',
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
