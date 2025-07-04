import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/core/core.dart';

import '../../../common/common.dart';
import '../../feature.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorResources.bgColor,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Our Register Store",
                          style: boldOverLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.vertical4,
                          ),
                          child: Text(
                            "Choose our store to order quickly and easily",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.vertical8,
                          ),
                          child: CustomTextField(
                            hintText: 'Search for Store',
                            inputAction: TextInputAction.done,
                            fillColor: ColorResources.transparentColor,
                            borderRadius: 32,
                            isPrefixIcon: true,
                            onSuffixTap: () {},
                            isSearch: true,
                            onChanged: (onChanged) {},
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.selectIndex();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 23,
                                ),
                                margin: EdgeInsets.all(Dimensions.smallMagin),
                                decoration: BoxDecoration(
                                  color: controller.select == -1
                                      ? ColorResources.primaryColor
                                      : ColorResources.black5,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.mode[0],
                                  style: TextStyle(
                                    color: controller.select == -1
                                        ? Colors.white
                                        : ColorResources.blackColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      controller.mode.length - 1,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          controller.selectIndexs(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                            horizontal: 23,
                                          ),
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: controller.select == index
                                                ? Color(0xFFDE2348)
                                                : ColorResources.black5,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            controller.mode[index + 1],
                                            style: TextStyle(
                                              color: controller.select == index
                                                  ? Colors.white
                                                  : ColorResources.blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    right: 8,
                    left: 8,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.store.length,
                      (context, index) {
                        final stores = controller.store.elementAt(index);
                        return Container(
                          // margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(Dimensions.space12),
                          decoration: BoxDecoration(
                            color: ColorResources.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: ColorResources.black45,
                                      ),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            // 'assets/image/fashion.png',
                                            stores['logo']!,),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectBool();
                                    },
                                    child: controller.isSelect
                                        ? Icon(
                                            Icons.bookmark,
                                            size: 24,
                                            color: ColorResources.primaryColor,
                                          )
                                        : Icon(
                                            Icons.bookmark_outline,
                                            size: 24,
                                          ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                stores['store_name']!,
                                style: semiBoldExtraLarge,
                              ),
                              Text(
                                stores['type']!,
                                style: regularDefault,
                              ),
                              Text(
                                stores['address']!,
                                style: regularDefault,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RouteHelper.nologNavbar,
                                    arguments: stores['type'],
                                  );
                                },
                                child: Container(
                                  height: 24,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: ColorResources.black5,
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.extrasmallRadius,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View Store',
                                      textAlign: TextAlign.center,
                                      style: mediumLarge.copyWith(
                                        color: ColorResources.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
