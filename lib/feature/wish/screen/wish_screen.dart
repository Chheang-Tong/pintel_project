import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import '/common/common.dart';

import '../../../core/core.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({super.key});
  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                Text(
                  'Wishlist',
                  style: boldOverLarge,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/image/trash.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: ColorResources.black75,
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemCount: 7,
          itemBuilder: (context, index) => Container(
            // margin: EdgeInsets.all(Dimensions.defaultPadding),
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
                        'https://i.pinimg.com/736x/0f/93/df/0f93df618cf8abd277c1af5d6c712ab0.jpg',
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
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(Dimensions.smallRadius),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.defaultRadius),
                              color:
                                  ColorResources.whiteColor.withOpacity(0.25),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                size: 20,
                              ),
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
                        'widget.name',
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
                          // if (widget.percendiscount != 0.0 ||
                          //     widget.pricediscount != 0.0)
                          //   Text(
                          //     widget.percendiscount != 0
                          //         ? '${widget.percendiscount.toInt()}% OFF'
                          //         : '${widget.pricediscount.toInt()}\$ OFF',
                          //     style: regularDefault.copyWith(
                          //       letterSpacing: 0.01,
                          //       color: ColorResources.errorColor,
                          //     ),
                          //   )
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
                              style:
                                  regularDefault.copyWith(letterSpacing: 0.01),
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
                              style:
                                  regularDefault.copyWith(letterSpacing: 0.02),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
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
          ),
        ),
      ),
      //  EmptyWish(),
    );
  }
}
