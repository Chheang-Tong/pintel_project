import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

import '../../feature.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckoutController controller = Get.put(CheckoutController());
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CheckoutController>(builder: (controller) {
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
                        controller: controller.fullnameController,
                        focusNode: controller.fullnameFocus,
                        nextFocus: controller.phoneFocus,
                        hintText: 'Full Name',
                        onChanged: (onChanged) {},
                        noneBorder: true,
                        fillColor: ColorResources.black5,
                      ),
                      SizedBox(height: Dimensions.space16),
                      CustomTextField(
                        controller: controller.phoneController,
                        focusNode: controller.phoneFocus,
                        nextFocus: controller.addNameFocus,
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
                        controller: controller.addNameController,
                        focusNode: controller.addNameFocus,
                        inputAction: TextInputAction.done,
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
                              controller: controller.addressController,
                              inputAction: TextInputAction.done,
                              hintText: 'Address',
                              onChanged: (onChanged) {},
                              noneBorder: true,
                              fillColor: ColorResources.black5,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                isScrollControlled: false,
                                persistent: true,
                                enableDrag: false,
                                AnimatedPadding(
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
                                        SizedBox(height: Dimensions.space10),
                                        Container(
                                          height: size.height * 0.28,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            color: ColorResources.errorColor,
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.defaultRadius,
                                            ),
                                          ),
                                          child: Location(
                                            move: false,
                                            showbtn: true,
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.space16),
                                        Obx(
                                          () => Text(
                                            locationController.address.value,
                                            style: semiBoldMediumLarge,
                                            maxLines: 2,
                                          ),
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.addressController
                                                          .text =
                                                      locationController
                                                          .address.value;
                                                  Get.back();
                                                },
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                              child:
                                  SvgPicture.asset('assets/image/marker.svg'),
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
                              controller.data.length,
                              (index) => GestureDetector(
                                onTap: () => controller.onSelected(index),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  padding: EdgeInsets.all(
                                    Dimensions.largePadding,
                                  ),
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex == index
                                        ? ColorResources.primary5
                                        : ColorResources.whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.defaultRadius,
                                    ),
                                    border: Border.all(
                                      color: controller.selectedIndex == index
                                          ? ColorResources.primaryColor
                                          : ColorResources.black5,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$ ${controller.data.keys.elementAt(index)}',
                                        style: semiBoldMediumLarge,
                                      ),
                                      SizedBox(height: Dimensions.space8),
                                      Text(
                                        '${controller.data.values.elementAt(index)}',
                                        style: regularLarge.copyWith(
                                          color:
                                              controller.selectedIndex == index
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
    });
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
