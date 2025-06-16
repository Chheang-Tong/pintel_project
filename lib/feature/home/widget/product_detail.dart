import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/components/dialog/addtocart.dart';
import 'package:pintel_project/core/core.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../feature.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final CartController controller = Get.put(
    CartController(
      apiClient: Get.find(),
    ),
  );
  int selectedSize = 0, selectColor = 0, quantity = 1;
  List<String> sizes = [
    'S',
    'M',
    'L',
  ];

  List<Color> colors = [
    Color(0xFF38495D),
    Color(0xFFF0F0F0),
    Color(0xFF333333),
    Color(0xFF6A81DD),
    Color(0xFFE53992),
  ];
  List<String> imageList = [
    'https://i.pinimg.com/736x/51/3b/4e/513b4e94057e88cf30a427ec923ac0d8.jpg',
    'https://i.pinimg.com/736x/60/66/3b/60663b164cf60deb0cfc65466bf6ed56.jpg',
    'https://i.pinimg.com/736x/07/ee/6b/07ee6b9c2c0575b45da416c86331eeb3.jpg',
    'https://i.pinimg.com/736x/ec/36/06/ec3606446470f70611c3c51fa22bb595.jpg',
    'https://i.pinimg.com/736x/c3/9c/06/c39c062e825596c20b8a8b2f8c168b00.jpg',
  ];
  int currentIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final arguments = Get.arguments as Map<String, dynamic>;
    final productId = arguments['id'];
    final productName = arguments['name'];
    // final productImage = arguments['image'];
    final productPrice = arguments['price'];
    // final productPercentdis = arguments['percentdis'];
    // final productPricedis = arguments['pricedis'];
    final productDiscription = arguments['discription'];
    final productStock = arguments['stock'];
    return GetBuilder<CartController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorResources.whiteColor,
          body: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.43,
                color: ColorResources.black75,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CarouselSlider.builder(
                        // carouselController: controller.carouselController,
                        itemCount: imageList.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                          int pageViewIndex,
                        ) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  imageList[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          viewportFraction: 1,
                          aspectRatio: 1,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 16,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.smallPadding),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorResources.whiteColor,
                          ),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: size.width,
                        height: 50,
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.largePadding),
                            topRight: Radius.circular(Dimensions.largePadding),
                          ),
                        ),
                        child: Text(
                          productName,
                          style: boldMegaLarge,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      right: 10,
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: imageList.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 7,
                          dotWidth: 7,
                          spacing: 4,
                          dotColor: ColorResources.black25,
                          activeDotColor: ColorResources.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.largePadding,
                    vertical: 0,
                  ),
                  color: ColorResources.whiteColor,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDiscription,
                          style: regularDefault.copyWith(
                            color: ColorResources.black75,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$$productPrice',
                              style: boldOverLarge,
                            ),
                            SizedBox(width: Dimensions.space4),
                            Text(
                              '\$6.75',
                              style: mediumLarge.copyWith(
                                color: ColorResources.black45,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '-\$ 2.00 OFF',
                              style: mediumLarge.copyWith(
                                color: ColorResources.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.space12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding,
                          ),
                          child: Text(
                            'Select Size',
                            style: mediumLarge,
                          ),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              sizes.length,
                              (index) => GestureDetector(
                                onTap: () => setState(() {
                                  selectedSize = index;
                                }),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.extrasmallRadius,
                                    ),
                                    color: selectedSize == index
                                        ? ColorResources.blackColor
                                        : ColorResources.whiteColor,
                                    border: Border.all(
                                      color: ColorResources.black10,
                                    ),
                                  ),
                                  child: Text(
                                    sizes[index],
                                    style: regularLarge.copyWith(
                                      color: selectedSize == index
                                          ? ColorResources.whiteColor
                                          : ColorResources.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.space12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding,
                          ),
                          child: Text(
                            'Select Size',
                            style: mediumLarge,
                          ),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              colors.length,
                              (index) => GestureDetector(
                                onTap: () => setState(() {
                                  selectColor = index;
                                }),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.all(Dimensions.smallPadding),
                                  margin: EdgeInsets.only(
                                    right: Dimensions.defaultMagin,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.smallRadius,
                                    ),
                                    border: Border.all(
                                      color: selectColor == index
                                          ? ColorResources.blackColor
                                          : ColorResources.black5,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: colors[index],
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.extrasmallRadius,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.space12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding,
                          ),
                          child: Text(
                            'Quantity',
                            style: mediumLarge,
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.space30),
                              border: Border.all(
                                color: ColorResources.black5,
                                width: 1,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  margin: EdgeInsets.all(Dimensions.smallMagin),
                                  padding:
                                      EdgeInsets.all(Dimensions.smallMagin),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.black5,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: 16,
                                    color: ColorResources.black45,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.smallPadding,
                                ),
                                child: Text(
                                  '$quantity',
                                  style: semiBoldMediumLarge,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity < productStock) {
                                      quantity++;
                                    } else {
                                      Get.snackbar(
                                        '$productName',
                                        'Out of Stock',
                                      );
                                    }
                                  });
                                },
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  margin: EdgeInsets.all(Dimensions.smallMagin),
                                  padding:
                                      EdgeInsets.all(Dimensions.smallPadding),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.blackColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 16,
                                    color: ColorResources.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorResources.black5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.addFavorite(productId);
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.defaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.smallRadius),
                          color: ColorResources.black5,
                        ),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.space16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.addToCarts(productId, quantity);
                          addToCardDialog();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.smallRadius),
                            color: ColorResources.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/image/cart.svg',
                                color: ColorResources.whiteColor,
                              ),
                              Text(
                                'Add to Cart',
                                style: semiBoldMediumLarge.copyWith(
                                  color: ColorResources.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
