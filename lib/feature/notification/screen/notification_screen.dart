import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isEmpty = false;
  final List<Map<String, String>> notiList = [
    {
      "title": "Order Placed",
      "subtitle": "Your order has been placed.",
      "icon": "assets/image/download.svg",
      "color": "1",
      "toName": RouteHelper.orderPlaced,
    },
    {
      "title": "Order Pending",
      "subtitle": "Your order is pending.",
      "icon": "assets/image/clock.svg",
      "color": "2",
      "toName": RouteHelper.orderPending,
    },
    {
      "title": "Order Shipping",
      "subtitle": "Your order has been shipped.",
      "icon": "assets/image/shipping.svg",
      "color": "3",
      "toName": RouteHelper.orderShipping,
    },
    {
      "title": "Order Complete",
      "subtitle": "Your order has been completed.",
      "icon": "assets/image/done.svg",
      "color": "4",
      "toName": RouteHelper.orderComplete,
    },
    {
      "title": "Order Cancelled",
      "subtitle": "Your order has been cancelled.",
      "icon": "assets/image/cancel.svg",
      "color": "5",
      "toName": RouteHelper.orderCancel,
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        title: 'Notifications',
      ),
      body: isEmpty
          ? EmptyNotification()
          : Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.largeMagin,
              ),
              child: Column(
                children: [
                  ...List.generate(
                    notiList.length,
                    (index) {
                      final noti = notiList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(noti['toName']!);
                        },
                        child: Container(
                          width: size.width,
                          margin: EdgeInsets.only(top: Dimensions.largeMagin),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: ColorResources.black5,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorResources
                                          .notificationStatusColor(
                                        noti['color']!,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      noti['icon']!,
                                      color: ColorResources.whiteColor,
                                      height: 32,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          noti['title']!,
                                          style: semiBoldMediumLarge,
                                        ),
                                        Text(
                                          noti['subtitle']!,
                                          style: regularDefault,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '31/12/2024',
                                        style: mediumDefault.copyWith(
                                          color: ColorResources.black75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.space16,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
