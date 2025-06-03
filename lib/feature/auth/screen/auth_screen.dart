import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/common/common.dart';
import '/core/core.dart';

import '../../feature.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController authController = Get.put(AuthController());
  bool isLoggedIn = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthView(
                storeName: 'Tos Tenh',
                aboutStore:
                    "Whether you're back for more or just getting started, log in or create an account to explore tasty deals and fresh finds!",
                title: isLoggedIn ? 'Log In' : 'Register',
                imageUrl:
                    'https://i.pinimg.com/736x/25/c4/e7/25c4e727090b7d6d89327808d41f4d70.jpg',
              ),
              isLoggedIn
                  ? DefaultTabController(
                      length: controller.tab.length,
                      animationDuration: Duration(milliseconds: 300),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.6,
                        color: ColorResources.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: TabBar(
                                controller: controller.tabController,
                                tabs: [
                                  ...controller.tab.map((tab) {
                                    return Tab(
                                      text: tab,
                                    );
                                  }),
                                ],
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                labelColor: ColorResources.blackColor,
                                automaticIndicatorColorAdjustment: true,
                                dividerHeight: 0,
                                padding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.only(left: 16),
                                indicatorPadding:
                                    EdgeInsets.symmetric(vertical: 6),
                                splashFactory: NoSplash.splashFactory,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorAnimation:
                                    TabIndicatorAnimation.linear,
                                indicator: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorResources.blackColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: [
                                      if (controller.currentIndex.value ==
                                          0) ...[
                                        SizedBox(height: Dimensions.space8),
                                        CustomTextField(
                                          controller:
                                              controller.phoneNumberController,
                                          onChanged: (onChanged) {},
                                          hintText: 'Phone Number',
                                          inputAction: TextInputAction.done,
                                          textInputType: TextInputType.phone,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                        ),
                                      ],
                                      if (controller.currentIndex.value ==
                                          1) ...[
                                        SizedBox(height: Dimensions.space8),
                                        CustomTextField(
                                          controller:
                                              controller.emailController,
                                          focusNode: controller.emailFocusNode,
                                          nextFocus:
                                              controller.passwordFocusNode,
                                          onChanged: (onChanged) {},
                                          hintText: 'Email',
                                          inputAction: TextInputAction.next,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                        ),
                                        SizedBox(height: Dimensions.space24),
                                        CustomTextField(
                                          controller:
                                              controller.passwordController,
                                          focusNode:
                                              controller.passwordFocusNode,
                                          onChanged: (onChanged) {},
                                          hintText: 'Password',
                                          inputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                          isPassword: true,
                                          isShowSuffixIcon: true,
                                        ),
                                      ],
                                      SizedBox(height: Dimensions.space24),
                                      SizedBox(
                                        width: size.width,
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorResources.primaryColor,
                                            padding: EdgeInsets.symmetric(
                                              vertical: Dimensions.space4,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Next',
                                            style: semiBoldMediumLarge.copyWith(
                                              color: ColorResources.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Didn't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      // Get.toNamed(RouteHelper.registerScreen);
                                      setState(() {
                                        isLoggedIn = false;
                                      });
                                    },
                                    child: Text(
                                      'Register',
                                      style: semiBoldMediumLarge.copyWith(
                                        color: ColorResources.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : DefaultTabController(
                      length: controller.tab.length,
                      animationDuration: Duration(milliseconds: 300),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.6,
                        color: ColorResources.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: TabBar(
                                controller: controller.tabController,
                                tabs: [
                                  ...controller.tab.map((tab) {
                                    return Tab(
                                      text: tab,
                                    );
                                  }),
                                ],
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                labelColor: ColorResources.blackColor,
                                automaticIndicatorColorAdjustment: true,
                                dividerHeight: 0,
                                padding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.only(left: 16),
                                indicatorPadding:
                                    EdgeInsets.symmetric(vertical: 6),
                                splashFactory: NoSplash.splashFactory,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorAnimation:
                                    TabIndicatorAnimation.linear,
                                indicator: BoxDecoration(
                                  color: ColorResources.whiteColor,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorResources.blackColor,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Expanded(
                                flex: 5,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: [
                                      if (controller.currentIndex.value ==
                                          0) ...[
                                        SizedBox(height: Dimensions.space8),
                                        CustomTextField(
                                          controller:
                                              controller.phoneNumberController,
                                          onChanged: (onChanged) {},
                                          hintText: 'Phone Number',
                                          inputAction: TextInputAction.done,
                                          textInputType: TextInputType.phone,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                        ),
                                      ],
                                      if (controller.currentIndex.value ==
                                          1) ...[
                                        SizedBox(height: Dimensions.space8),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomTextField(
                                                controller: controller
                                                    .firstnameController,
                                                focusNode: controller
                                                    .firstnameFocusNode,
                                                nextFocus: controller
                                                    .lastnameFocusNode,
                                                onChanged: (onChanged) {},
                                                hintText: 'First Name',
                                                inputAction:
                                                    TextInputAction.next,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                noneBorder: true,
                                                fillColor:
                                                    ColorResources.black5,
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.space20),
                                            Expanded(
                                              child: CustomTextField(
                                                controller: controller
                                                    .lastnameController,
                                                focusNode: controller
                                                    .lastnameFocusNode,
                                                nextFocus:
                                                    controller.emailFocusNode,
                                                onChanged: (onChanged) {},
                                                hintText: 'Last Name',
                                                inputAction:
                                                    TextInputAction.next,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                noneBorder: true,
                                                fillColor:
                                                    ColorResources.black5,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Dimensions.space24),
                                        CustomTextField(
                                          controller:
                                              controller.emailController,
                                          focusNode: controller.emailFocusNode,
                                          nextFocus:
                                              controller.phoneNumberFocusNode,
                                          onChanged: (onChanged) {},
                                          hintText: 'Email',
                                          inputAction: TextInputAction.next,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                        ),
                                        SizedBox(height: Dimensions.space24),
                                        CustomTextField(
                                          controller:
                                              controller.phoneNumberController,
                                          focusNode:
                                              controller.phoneNumberFocusNode,
                                          nextFocus:
                                              controller.passwordFocusNode,
                                          onChanged: (onChanged) {},
                                          hintText: 'Phone Number',
                                          inputAction: TextInputAction.next,
                                          textInputType: TextInputType.phone,
                                          noneBorder: true,
                                          fillColor: ColorResources.black5,
                                        ),
                                        SizedBox(height: Dimensions.space24),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomTextField(
                                                controller: controller
                                                    .passwordController,
                                                focusNode: controller
                                                    .passwordFocusNode,
                                                nextFocus: controller
                                                    .confirmationFocusNode,
                                                onChanged: (onChanged) {},
                                                hintText: 'Password',
                                                inputAction:
                                                    TextInputAction.next,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                noneBorder: true,
                                                fillColor:
                                                    ColorResources.black5,
                                                isPassword: true,
                                                isShowSuffixIcon: true,
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.space20),
                                            Expanded(
                                              child: CustomTextField(
                                                controller: controller
                                                    .confirmationController,
                                                focusNode: controller
                                                    .confirmationFocusNode,
                                                onChanged: (onChanged) {},
                                                hintText: 'Confirmation',
                                                inputAction:
                                                    TextInputAction.done,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                noneBorder: true,
                                                fillColor:
                                                    ColorResources.black5,
                                                isPassword: true,
                                                isShowSuffixIcon: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                      SizedBox(height: Dimensions.space20),
                                      SizedBox(
                                        width: size.width,
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorResources.primaryColor,
                                            padding: EdgeInsets.symmetric(
                                              vertical: Dimensions.space4,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.toNamed(RouteHelper.verifyScreen);
                                          },
                                          child: Text(
                                            'Next',
                                            style: semiBoldMediumLarge.copyWith(
                                              color: ColorResources.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      // Get.toNamed(RouteHelper.registerScreen);
                                      setState(() {
                                        isLoggedIn = true;
                                      });
                                    },
                                    child: Text(
                                      'LogIn',
                                      style: semiBoldMediumLarge.copyWith(
                                        color: ColorResources.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
