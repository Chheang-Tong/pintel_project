import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';

class Complete extends StatelessWidget {
  const Complete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            10,
            (index) => Container(
              width: size.width,
              padding: EdgeInsets.all(Dimensions.largePadding),
              margin: EdgeInsets.symmetric(vertical: Dimensions.space8),
              decoration: BoxDecoration(
                color: ColorResources.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                boxShadow: [
                  BoxShadow(
                    color: ColorResources.shadowColor.withOpacity(0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customer Name',
                        style: boldMediumLarge,
                      ),
                      Text('\$55.00', style: mediumLarge),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '59 St 534, Phnom Penh, Cambodia',
                        style: regularDefault,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.smallMagin,
                          vertical: Dimensions.extrasmallMagin,
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.orderStatusColor('1')
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            Dimensions.smallRadius,
                          ),
                        ),
                        child: Text(
                          'Pending',
                          style: mediumDefault.copyWith(
                            color: ColorResources.orderStatusColor('1'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.space16),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              isScrollControlled: true,
                              persistent: true,
                              enableDrag: true,
                              AnimatedPadding(
                                padding: MediaQuery.of(context).viewInsets,
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.decelerate,
                                child: Container(
                                  padding: EdgeInsets.all(
                                    Dimensions.largePadding,
                                  ),
                                  height: size.height * 0.792,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: ColorResources.bgColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        Dimensions.largeRadius,
                                      ),
                                      topRight: Radius.circular(
                                        Dimensions.largeRadius,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 6,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: ColorResources.black45
                                                .withValues(alpha: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.space16),
                                      Text(
                                        'Order Details',
                                        style: boldOverLarge,
                                      ),
                                      SizedBox(height: Dimensions.space10),
                                      Container(
                                        width: size.width,
                                        padding: EdgeInsets.all(
                                          Dimensions.largePadding,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorResources.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.defaultRadius,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Sumary',
                                                  style: boldMediumLarge,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: Dimensions.space8),
                                            textTwoColumn(
                                              title1: 'Name',
                                              value1: 'Customer Name',
                                              title2: 'Phone Number',
                                              value2: '098214986',
                                            ),
                                            textTwoColumn(
                                              title1: 'Status',
                                              value1: 'Pending',
                                              title2: 'Order Date',
                                              value2: 'May 18, 2025',
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Delivery Address',
                                                      style: regularDefault
                                                          .copyWith(
                                                        color: ColorResources
                                                            .black75,
                                                      ),
                                                    ),
                                                    Text(
                                                      '73 St 323, Phnom Penh, Cambodia',
                                                      style: regularLarge,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.space16),
                                      Container(
                                        width: size.width,
                                        padding: EdgeInsets.all(
                                          Dimensions.largePadding,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorResources.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.defaultRadius,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Item',
                                                  style: boldMediumLarge,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: Dimensions.space8),
                                            Column(
                                              children: [
                                                ...List.generate(
                                                  2,
                                                  (index) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: Dimensions
                                                          .smallPadding,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '1x ',
                                                                style:
                                                                    regularLarge,
                                                              ),
                                                              Text(
                                                                'Product Name',
                                                                style:
                                                                    regularLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$55.00',
                                                          style: regularLarge,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: Dimensions.space8,
                                              ),
                                              child: DotDivider(
                                                color: ColorResources.black10,
                                              ),
                                            ),
                                            count(
                                              text: 'Item count',
                                              count: '3',
                                            ),
                                            pay(
                                              text: 'Subtotal',
                                              price: '75.00',
                                            ),
                                            pay(
                                              text: 'Discount',
                                              price: '1.50',
                                            ),
                                            pay(
                                              text: 'Shipping',
                                              price: '5.00',
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: Dimensions.space16,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Grand Total',
                                                    style: mediumLarge,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '\$78.50',
                                                    style: mediumLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorResources.black5,
                              borderRadius: BorderRadius.circular(
                                Dimensions.defaultRadius,
                              ),
                            ),
                            child: Text(
                              'View Details',
                              textAlign: TextAlign.center,
                              style: mediumLarge.copyWith(
                                color: ColorResources.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.space16),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorResources.primaryColor,
                              borderRadius: BorderRadius.circular(
                                Dimensions.defaultRadius,
                              ),
                            ),
                            child: Text(
                              'Reorder',
                              textAlign: TextAlign.center,
                              style: mediumLarge.copyWith(
                                color: ColorResources.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }

  textTwoColumn({
    required String title1,
    required String value1,
    required String title2,
    required String value2,
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
                  value1,
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
                  value2,
                  style: regularLarge,
                ),
              ],
            ),
          )
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
