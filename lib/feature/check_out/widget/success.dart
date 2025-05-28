import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';
class OrderSuccess extends StatefulWidget {
  const OrderSuccess({super.key});
  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: Dimensions.bodyMagin,
        child: Column(
          children: [
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.space8),
              padding: EdgeInsets.all(Dimensions.extraLargePadding),
              decoration: BoxDecoration(
                color: ColorResources.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions.space16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 8,
                        color: ColorResources.success10,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.largePadding),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.successColor,
                      ),
                      child: Icon(
                        Icons.done,
                        color: ColorResources.whiteColor,
                        weight: 22,
                      ),
                    ),
                  ),
                  Text(
                    'Order Successful',
                    style: boldOverLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Thank you so much for your order!',
                    style: regularLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.space8),
              padding: EdgeInsets.all(Dimensions.largePadding),
              decoration: BoxDecoration(
                color: ColorResources.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Detail',
                    style: boldMediumLarge,
                  ),
                  detail(
                    title1: 'Name',
                    subtitle1: 'Customer 1',
                    title2: 'Phone Number',
                    subtitle2: '07944412',
                  ),
                  detail(
                    title1: 'Status',
                    subtitle1: 'Pending',
                    title2: 'Order Date',
                    subtitle2: 'May 18, 2025',
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Address',
                          style: regularDefault.copyWith(
                            color: ColorResources.black75,
                          ),
                        ),
                        Text(
                          '73 St 323, Phnom Penh, Cambodia',
                          style: regularLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.largePadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.largeRadius,
                      ),
                      color: ColorResources.black5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('1x', style: regularLarge),
                            SizedBox(width: Dimensions.space7),
                            Expanded(
                              child: Text('Waisted Jeans', style: regularLarge),
                            ),
                            Text('\$25.00', style: regularLarge),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.space8,
                          ),
                          child: DotDivider(
                            color: ColorResources.black10,
                          ),
                        ),
                        count(text: 'Item count', count: '3'),
                        pay(text: 'Subtotal', price: '75.00'),
                        pay(text: 'Discount', price: '1.50'),
                        pay(text: 'Shipping', price: '5.00'),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: Dimensions.space16),
                          child: Row(
                            children: [
                              Text('Grand Total', style: mediumLarge),
                              Spacer(),
                              Text('\$78.50', style: mediumLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  detail({
    required String title1,
    required String subtitle1,
    required String title2,
    required String subtitle2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: regularDefault.copyWith(
                    color: ColorResources.black75,
                  ),
                ),
                Text(
                  subtitle1,
                  style: regularLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: regularDefault.copyWith(
                    color: ColorResources.black75,
                  ),
                ),
                Text(
                  subtitle2,
                  style: regularLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget count({required String text, required String count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.smallPadding,
      ),
      child: Row(
        children: [
          Text('$text:',
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
          Spacer(),
          Text(count,
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
        ],
      ),
    );
  }

  Widget pay({required String text, required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.smallPadding,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: regularLarge.copyWith(
              color: ColorResources.black75,
            ),
          ),
          Spacer(),
          Text('\$$price',
              style: regularLarge.copyWith(
                color: ColorResources.black75,
              )),
        ],
      ),
    );
  }
}
