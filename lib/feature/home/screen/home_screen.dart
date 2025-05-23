import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';
import 'package:pintel_project/feature/feature.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: size.width * 0.11,
                      width: size.width * .11,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorResources.black10,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/image/fashion.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Tos Tenh",
                        style: boldExtraLarge,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.cartScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.whiteColor,
                        ),
                        child: SvgPicture.asset(
                          'assets/image/cart.svg',
                          color: ColorResources.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  height: size.height * 0.172,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorResources.black45,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.banner.length,
                          onPageChanged: (index) =>
                              controller.onPageChanged(index),
                          physics: PageScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              controller.banner[index],
                              fit: BoxFit.cover,
                              width: size.width,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 15,
                        bottom: 15,
                        left: 0,
                        child: Container(
                          height: size.height * 0.1,
                          width: size.width * 0.07,
                          decoration: BoxDecoration(
                            color: ColorResources.white25,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.banner.length,
                                  (index) {
                                    return Container(
                                      height: 12,
                                      width: 4,
                                      margin: EdgeInsets.all(3),
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: controller.currentIndex.value ==
                                              index
                                          ? Container(
                                              height: size.height,
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorResources.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            )
                                          : null,
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        borderRadius: 32,
                        isPrefixIcon: true,
                        fillColor: ColorResources.transparentColor,
                        hintText: 'Search for Product',
                        inputAction: TextInputAction.done,
                        onChanged: (onChanged) {},
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.filterScreen);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.black5,
                        ),
                        child: SvgPicture.asset('assets/image/filter.svg'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Category',
                    style: boldExtraLarge,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.width * 0.13,
                      width: size.width * 0.13,
                      margin: EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.primaryColor,
                      ),
                      child: Text(
                        'All',
                        style: semiBoldDefault.copyWith(
                          color: ColorResources.whiteColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...controller.cate.entries.map(
                              (entry) {
                                return Column(
                                  children: [
                                    Container(
                                      height: size.width * .13,
                                      width: size.width * .13,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ColorResources.black45,
                                        ),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(entry.value),
                                      ),
                                    ),
                                    Text(
                                      entry.key,
                                      style: regularDefault.copyWith(),
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Endjoy Shopping',
                    style: boldMediumLarge,
                  ),
                ),
                SizedBox(
                  height: size.height * 1.58,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.73,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return ProductCartV1();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
