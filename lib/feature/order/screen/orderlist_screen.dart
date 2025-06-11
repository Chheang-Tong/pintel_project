import 'package:flutter/material.dart';

import '/common/common.dart';
import '/core/core.dart';
import '/feature/feature.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Listing'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.largeMagin),
        width: size.width,
        height: size.height,
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: ColorResources.primaryColor,
                automaticIndicatorColorAdjustment: true,
                dividerHeight: 0,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.only(left: 16),
                indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorAnimation: TabIndicatorAnimation.linear,
                indicator: BoxDecoration(
                  color: ColorResources.transparentColor,
                  border: Border(
                    bottom: BorderSide(
                      color: ColorResources.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                tabs: [
                  Tab(text: 'All Orders'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Cancelled'),
                  Tab(text: 'Shipping'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Delivered'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AllOrder(),
                    Pending(),
                    Cancel(),
                    Shipping(),
                    Complete(),
                    Delivery(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
