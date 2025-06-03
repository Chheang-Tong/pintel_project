import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/core.dart';
import '/feature/feature.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          //  title:Text('VerifyOtpScreen'),
          ),
      body: GetBuilder<AuthController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.largeMagin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify OTP Code',
                style: boldMegaLarge,
              ),
              Text(
                'We have sent a OTP to ${controller.phoneNumberController.value.text}  Please type code in here',
                style: regularLarge.copyWith(
                  color: ColorResources.black75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 32,
                ),
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: ColorResources.transparentColor,
                    activeBorderWidth: 1,
                    inactiveFillColor: ColorResources.transparentColor,
                    inactiveColor: ColorResources.black10,
                    selectedFillColor: ColorResources.transparentColor,
                    selectedColor: ColorResources.blackColor,
                    selectedBorderWidth: 1,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: ColorResources.transparentColor,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: controller.otpController,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {
                      // currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.loginNavbar);
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: 13),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: controller.otpController.text.isEmpty
                        ? ColorResources.black10
                        : ColorResources.primaryColor,
                  ),
                  child: controller.otpController.text.isEmpty
                      ? Text(
                          'Verify',
                          style: semiBoldMediumLarge.copyWith(
                            color: ColorResources.black45,
                          ),
                        )
                      : Text(
                          'Verify',
                          style: semiBoldMediumLarge.copyWith(
                            color: ColorResources.whiteColor,
                          ),
                        ),
                ),
              ),
              SizedBox(height: Dimensions.space20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't receive OTP?"),
                  TextButton(
                    onPressed: () {},
                    child: Text('Resend',
                        style: semiBoldMediumLarge.copyWith(
                          color: ColorResources.primaryColor,
                        )),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
