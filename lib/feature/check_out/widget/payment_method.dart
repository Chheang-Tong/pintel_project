import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../common/common.dart';
import '../../../core/core.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Map<int, Map<String, String>> method = {
    0: {
      "title": "Case on Delivery",
      "subtitle": "Pay with cash when your order arrives.",
      "icon": "assets/image/cash.svg",
    },
    1: {
      "title": "ABA KHQR",
      "subtitle": "Pay KHQR code with your banking app.",
      "icon": "assets/image/qr.svg",
    },
  };
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: boldOverLarge,
        ),
      ),
      body: Container(
        margin: Dimensions.bodyMagin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Payment Method',
                style: semiBoldMediumLarge,
              ),
              ...List.generate(
                method.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.largePadding),
                    margin: EdgeInsets.symmetric(vertical: Dimensions.space8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.largeRadius,
                      ),
                      color: selectedIndex == index
                          ? ColorResources.primaryColor
                          : ColorResources.whiteColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: Dimensions.space9,
                              ),
                              padding: EdgeInsets.all(Dimensions.space10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedIndex == index
                                    ? ColorResources.black10
                                    : ColorResources.black5,
                              ),
                              child: SvgPicture.asset(
                                method[index]!['icon']!,
                                color: selectedIndex == index
                                    ? ColorResources.whiteColor
                                    : ColorResources.blackColor,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    method[index]!['title']!,
                                    style: mediumLarge.copyWith(
                                      color: selectedIndex == index
                                          ? ColorResources.whiteColor
                                          : ColorResources.blackColor,
                                    ),
                                  ),
                                  Text(
                                    method[index]!['subtitle']!,
                                    style: regularDefault.copyWith(
                                      color: selectedIndex == index
                                          ? ColorResources.whiteColor
                                          : ColorResources.black75,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Your Order Summary',
                style: semiBoldMediumLarge,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.largePadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.largeRadius,
                  ),
                  color: ColorResources.whiteColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('1x', style: regularLarge),
                        SizedBox(width: Dimensions.space7),
                        Expanded(
                          child: Text('Waisted Jeans', style: regularLarge),
                        ),
                        Text('\$25.00', style: regularLarge),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.space16,
                      ),
                      child: DotDivider(
                        color: ColorResources.black10,
                      ),
                    ),
                    count(text: 'Item count', count: '3'),
                    pay(text: 'Subtotal', price: '75.00'),
                    pay(text: 'Discount', price: '1.50'),
                    pay(text: 'Shipping', price: '5.00'),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.space16),
                      child: Row(
                        children: [
                          Text('Grand Total', style: mediumLarge),
                          Spacer(),
                          Text('\$78.50', style: mediumLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.space16,
        ),
        child: Row(
          children: [
            floatBtn(
              onTap: () {
                Get.back();
              },
              color: ColorResources.black75,
              text: 'Back',
              bgColor: ColorResources.black5,
            ),
            SizedBox(width: Dimensions.space16),
            floatBtn(
              onTap: () {
                Get.toNamed(RouteHelper.paybyABA);
              },
              color: ColorResources.whiteColor,
              text: 'Next',
              bgColor: ColorResources.primaryColor,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget floatBtn({
    required Function onTap,
    required Color color,
    required Color bgColor,
    required String text,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          ),
          child: Center(
              child: Text(
            text,
            style: semiBoldMediumLarge.copyWith(
              color: color,
            ),
          )),
        ),
      ),
    );
  }

  Widget count({required String text, required String count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.smallPadding,
      ),
      child: Row(
        children: [
          Text('$text:',
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
          Spacer(),
          Text(count,
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
        ],
      ),
    );
  }

  Widget pay({required String text, required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.smallPadding,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: regularLarge.copyWith(
              color: ColorResources.black75,
            ),
          ),
          Spacer(),
          Text('\$$price',
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
        ],
      ),
    );
  }
}
