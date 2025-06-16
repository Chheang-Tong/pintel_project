import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class SaveStoreScreen extends StatefulWidget {
  const SaveStoreScreen({super.key});
  @override
  State<SaveStoreScreen> createState() => _SaveStoreScreenState();
}

class _SaveStoreScreenState extends State<SaveStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        lead: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: 'Store Saved',
        action: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.smallRadius),
            color: ColorResources.primary5,
          ),
          child: SvgPicture.asset('assets/image/trash.svg'),
        ),
      ),
      backgroundColor: ColorResources.bgColor,
      body: Container(
        padding: EdgeInsets.all(Dimensions.largePadding),
        // color: ColorResources.pendingColor,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .85,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.all(Dimensions.space12),
                decoration: BoxDecoration(
                  color: ColorResources.whiteColor,
                  // color: ColorResources.errorColor,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        right: -4,
                        top: -4,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.close),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorResources.black5,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/image/fashion.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Tos Tenh',
                          style: mediumLarge,
                        ),
                        Text(
                          'Fashion',
                          style: regularDefault.copyWith(
                            color: ColorResources.black75,
                            letterSpacing: 0.02,
                          ),
                        ),
                        Text(
                          'Toul Kork. Phnom Penhssssssssss',
                          style: regularDefault.copyWith(
                            color: ColorResources.black75,
                            letterSpacing: 0.02,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: ColorResources.pendingColor,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
