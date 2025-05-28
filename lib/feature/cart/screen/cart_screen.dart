import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/core/core.dart';

import '../../../common/common.dart';
import '../../feature.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(
    CartController(
      apiClient: Get.find(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shoping Cart',
          style: boldOverLarge,
        ),
      ),
      backgroundColor: ColorResources.bgColor,
      body: GetBuilder<CartController>(
        builder: (cartController) {
          return cartController.cartItems.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmptyCart(
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.largeMagin,
                      ),
                      height: size.height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu Count: ${cartController.totalProductTypes}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              confirmClear(onTap: () {
                                cartController.clearCart();
                                Get.back();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.defaultRadius,
                                ),
                                color: ColorResources.primary5,
                              ),
                              child: SvgPicture.asset('assets/image/trash.svg'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          final cart = cartController.cartItems[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.largeMagin,
                              ),
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.08,
                                        height: size.width * 0.08,
                                        child: IconButton(
                                          iconSize: 18,
                                          constraints: BoxConstraints(),
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                              EdgeInsets.all(4),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              ColorResources.black5,
                                            ),
                                          ),
                                          onPressed: () {
                                            cartController.removeonceFromCart(
                                                cart.product);
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: Dimensions.largeMagin,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                cart.product.title,
                                                style: mediumLarge,
                                              ),
                                              Text(
                                                '\$ ${cartController.getItemTotalPrice(cart.product)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.space30,
                                          ),
                                          border: Border.all(
                                            color: ColorResources.black5,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.removeFromCart(
                                                  cart.product,
                                                );
                                              },
                                              child: Container(
                                                height: 18,
                                                width: 18,
                                                margin: EdgeInsets.all(4),
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorResources.black5,
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 8,
                                                  color: ColorResources.black45,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${cart.quantity}',
                                              style: semiBoldMediumLarge,
                                            ),
                                            GestureDetector(
                                              onTap: () => cartController
                                                  .addToCart(cart.product),
                                              child: Container(
                                                height: 18,
                                                width: 18,
                                                margin: EdgeInsets.all(4),
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      ColorResources.blackColor,
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 8,
                                                  color:
                                                      ColorResources.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: ColorResources.black5,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item Count',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                              Text(
                                ' ${cartController.totalItems}',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                              Text(
                                '\$ ${cartController.totalAmount}',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                              Text(
                                '\$ ${cartController.totalAmount}',
                                style: regularMediumLarge.copyWith(
                                  color: ColorResources.black75,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: semiBoldMediumLarge,
                              ),
                              Text(
                                '\$ ${cartController.totalAmount}',
                                style: semiBoldMediumLarge,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.space25,
                          ),
                          SizedBox(
                            width: size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(RouteHelper.checkoutScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.defaultRadius,
                                  ),
                                ),
                                backgroundColor: ColorResources.primaryColor,
                              ),
                              child: Text(
                                'Checkout',
                                style: semiBoldMediumLarge.copyWith(
                                  color: ColorResources.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
