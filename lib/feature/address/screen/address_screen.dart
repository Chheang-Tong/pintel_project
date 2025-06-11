import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: ColorResources.black10,
      appBar: CustomAppBar(
        lead: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: 'Address Listing',
        action: GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.createAddress),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorResources.primary5,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: ColorResources.primaryColor,
                ),
                Text(
                  'Add',
                  style: mediumLarge.copyWith(
                    color: ColorResources.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.defaultMagin),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Home',
                        style: semiBoldMediumLarge,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.space12,
                          vertical: Dimensions.smallPadding,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorResources.success5,
                        ),
                        child: Text(
                          'Default',
                          style: mediumDefault.copyWith(
                            color: ColorResources.successColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '73 St 323, Phnom Penh, Cambodia',
                    style: regularDefault,
                  ),
                  SizedBox(
                    height: Dimensions.space16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorResources.black5,
                          ),
                          child: Text(
                            'Edit',
                            style: mediumLarge,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.space16,
                      ),
                      Expanded(
                        child: Container(
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorResources.primaryColor,
                          ),
                          child: Text(
                            'Delete',
                            style: mediumLarge.copyWith(
                              color: ColorResources.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
