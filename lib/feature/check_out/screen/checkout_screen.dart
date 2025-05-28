import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map<String, dynamic> data = {
    "5.00": "Cambodia Express",
    "3.00": "DHL Express",
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
            children: [
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
                        Text(
                          'Contact Info',
                          style: semiBoldMediumLarge,
                        ),
                        Text(
                          '*',
                          style: semiBoldMediumLarge.copyWith(
                            color: ColorResources.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.space16),
                    CustomTextField(
                      hintText: 'Full Name',
                      onChanged: (onChanged) {},
                      noneBorder: true,
                      fillColor: ColorResources.black5,
                    ),
                    SizedBox(height: Dimensions.space16),
                    CustomTextField(
                      hintText: 'Phone Number',
                      onChanged: (onChanged) {},
                      noneBorder: true,
                      fillColor: ColorResources.black5,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.space16),
              Container(
                padding: EdgeInsets.all(Dimensions.largePadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.largeRadius,
                  ),
                  color: ColorResources.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: semiBoldMediumLarge,
                    ),
                    SizedBox(height: Dimensions.space16),
                    CustomTextField(
                      hintText: 'Address Name',
                      onChanged: (onChanged) {},
                      noneBorder: true,
                      fillColor: ColorResources.black5,
                    ),
                    SizedBox(height: Dimensions.space16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Address',
                            onChanged: (onChanged) {},
                            noneBorder: true,
                            fillColor: ColorResources.black5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: AnimatedPadding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  duration: const Duration(milliseconds: 50),
                                  curve: Curves.decelerate,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      Dimensions.largePadding,
                                    ),
                                    height: size.height * 0.60,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: ColorResources.whiteColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          Dimensions.largeRadius,
                                        ),
                                        topRight: Radius.circular(
                                          Dimensions.largeRadius,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const BottomSheetBar(),
                                        SizedBox(height: Dimensions.space16),
                                        Text(
                                          'Choose Address',
                                          style: semiBoldMediumLarge,
                                        ),
                                        SizedBox(height: Dimensions.space16),
                                        Container(
                                          height: size.height * 0.28,
                                          width: size.width,
                                          padding: EdgeInsets.all(
                                            Dimensions.largePadding,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorResources.black5,
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.defaultRadius,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.space16),
                                        Text(
                                          'Street 42, Sangkat Psar Daeum Kor, Khan 7 Makara, Phnom Penh City, Cambodia',
                                          style: semiBoldMediumLarge,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorResources.black5,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.smallRadius,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Cancel',
                                                      style: semiBoldMediumLarge
                                                          .copyWith(
                                                        color: ColorResources
                                                            .black75,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.space20),
                                            Expanded(
                                              child: Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  color: ColorResources
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimensions.smallRadius,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Add',
                                                    style: semiBoldMediumLarge
                                                        .copyWith(
                                                      color: ColorResources
                                                          .whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              isScrollControlled: true,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.space8,
                            ),
                            padding: EdgeInsets.all(Dimensions.space14),
                            decoration: BoxDecoration(
                              color: ColorResources.black10,
                              borderRadius: BorderRadius.circular(
                                Dimensions.defaultRadius,
                              ),
                            ),
                            child: SvgPicture.asset('assets/image/marker.svg'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.space16),
              Container(
                padding: EdgeInsets.all(Dimensions.largePadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.largeRadius,
                  ),
                  color: ColorResources.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Method',
                      style: semiBoldMediumLarge,
                    ),
                    SizedBox(height: Dimensions.space16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            data.length,
                            (index) => GestureDetector(
                              onTap: () => setState(() {
                                selectedIndex = index;
                              }),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                padding: EdgeInsets.all(
                                  Dimensions.largePadding,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? ColorResources.primary5
                                      : ColorResources.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.defaultRadius,
                                  ),
                                  border: Border.all(
                                    color: selectedIndex == index
                                        ? ColorResources.primaryColor
                                        : ColorResources.black5,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$ ${data.keys.elementAt(index)}',
                                      style: semiBoldMediumLarge,
                                    ),
                                    SizedBox(height: Dimensions.space8),
                                    Text(
                                      '${data.values.elementAt(index)}',
                                      style: regularLarge.copyWith(
                                        color: selectedIndex == index
                                            ? ColorResources.blackColor
                                            : ColorResources.black75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.space16),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(
              RouteHelper.paymentScreen,
            );
          },
          backgroundColor: ColorResources.primaryColor,
          child: Text(
            'Next',
            style: semiBoldMediumLarge.copyWith(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 6,
        width: 32,
        decoration: BoxDecoration(
            color: ColorResources.black45.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
