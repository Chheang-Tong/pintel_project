import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class Screen01 extends StatefulWidget {
  const Screen01({super.key});
  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
  final HomeController controller = Get.put(HomeController());
  final CartController cartController =
      Get.put(CartController(apiClient: Get.find()));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CartController>(
      builder: (cartcontroller) {
        return Scaffold(
          backgroundColor: ColorResources.bgColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorResources.black10,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/image/fashion.png'),
                ),
              ),
            ),
            title: Text(
              "Tos Tenh",
              style: boldExtraLarge,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.cartScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorResources.whiteColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/image/cart.svg',
                    color: ColorResources.blackColor,
                  ),
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      height: size.height * 0.172,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorResources.black45,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.banner.length,
                              onPageChanged: (index) =>
                                  controller.onPageChanged(index),
                              physics: PageScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  controller.banner[index],
                                  fit: BoxFit.cover,
                                  width: size.width,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 15,
                            bottom: 15,
                            left: 0,
                            child: Container(
                              height: size.height * 0.1,
                              width: size.width * 0.07,
                              decoration: BoxDecoration(
                                color: ColorResources.white25,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Obx(
                                () => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      controller.banner.length,
                                      (index) {
                                        return Container(
                                          height: 12,
                                          width: 4,
                                          margin: EdgeInsets.all(3),
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: controller.currentIndex.value ==
                                                  index
                                              ? Container(
                                                  height: size.height,
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorResources.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(4),
                                                  ),
                                                )
                                              : null,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            borderRadius: 32,
                            isPrefixIcon: true,
                            fillColor: ColorResources.transparentColor,
                            hintText: 'Search for Product',
                            inputAction: TextInputAction.done,
                            onChanged: (onChanged) {},
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.filterScreen);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorResources.black5,
                            ),
                            child: SvgPicture.asset('assets/image/filter.svg'),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Category',
                        style: boldExtraLarge,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.width * 0.13,
                          width: size.width * 0.13,
                          margin: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorResources.primaryColor,
                          ),
                          child: Text(
                            'All',
                            style: semiBoldDefault.copyWith(
                              color: ColorResources.whiteColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...controller.cate.entries.map(
                                  (entry) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: size.width * .13,
                                          width: size.width * .13,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorResources.black45,
                                            ),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(entry.value),
                                          ),
                                        ),
                                        Text(
                                          entry.key,
                                          style: regularDefault.copyWith(),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Enjoy Shopping',
                        style: boldMediumLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 80),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 8,
                    // crossAxisSpacing: 8,
                    childAspectRatio: 0.80,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: productList.length,
                    (context, index) {
                      final product = productList[index];
                      return ProductCartV2(
                        name: product.title,
                        image: product.image,
                        percendiscount: product.percendiscount,
                        pricediscount: product.pricediscount,
                        onTap: () {
                          Get.toNamed(
                            RouteHelper.productDetails,
                            arguments: {
                              'id': product.id,
                              'name': product.title,
                              'image': product.image,
                              'price': product.price,
                              'percentdis': product.percendiscount,
                              'pricedis': product.pricediscount,
                              'discription': product.description,
                              'stock': product.stock,
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
