import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        lead: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: 'Reset Password',
        action: Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.defaultPadding,
            horizontal: Dimensions.space12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
            color: ColorResources.primary5,
          ),
          child: Text(
            'Update',
            style: mediumLarge.copyWith(
              color: ColorResources.primaryColor,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(Dimensions.largeMagin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password must be at least 8 character',
              style: regularMediumLarge.copyWith(
                color: ColorResources.black75,
                // height: 16,
                letterSpacing: 0.02,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.largePadding,
                bottom: Dimensions.defaultPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'New password',
                    style: semiBoldMediumLarge,
                  ),
                  Text(
                    ' *',
                    style: semiBoldMediumLarge.copyWith(
                      color: ColorResources.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            CustomTextField(
              onChanged: (onChanged) {},
              noneBorder: true,
              fillColor: ColorResources.black5,
              hintText: 'Enter New Password',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.largePadding,
                bottom: Dimensions.defaultPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'New password',
                    style: semiBoldMediumLarge,
                  ),
                  Text(
                    ' *',
                    style: semiBoldMediumLarge.copyWith(
                      color: ColorResources.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            CustomTextField(
              onChanged: (onChanged) {},
              noneBorder: true,
              fillColor: ColorResources.black5,
              hintText: 'Enter New Password',
            ),
          ],
        ),
      ),
    );
  }
}
