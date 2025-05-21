import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

import '../../feature.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final formKey = GlobalKey<FormState>();
  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<FilterController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResources.bgColor,
        appBar: AppBar(
          title: Text('Filter Option'),
          titleTextStyle: semiBoldExtraLarge.copyWith(
            color: ColorResources.blackColor,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                controller.reset();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 68,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorResources.primary5,
                ),
                child: Text(
                  'Reset',
                  style: semiBoldDefault.copyWith(
                    color: ColorResources.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Price Range',
                  style: semiBoldDefault.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: controller.fromController,
                      focusNode: controller.fromNode,
                      nextFocus: controller.toNode,
                      borderRadius: 16,
                      hintText: 'From',
                      inputAction: TextInputAction.next,
                      textInputType: TextInputType.numberWithOptions(),
                      onChanged: (onChanged) {},
                    ),
                  ),
                  SizedBox(width: 23),
                  Expanded(
                    child: CustomTextField(
                      controller: controller.toController,
                      focusNode: controller.toNode,
                      hintText: 'To',
                      borderRadius: 16,
                      inputAction: TextInputAction.done,
                      textInputType: TextInputType.numberWithOptions(),
                      onChanged: (onChanged) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Promotion Type',
                  style: semiBoldDefault.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorResources.whiteColor,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedValue,
                    hint: Text('Select'),
                    borderRadius: BorderRadius.circular(16),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (String? newValue) {
                      controller.onChanged(newValue!);
                    },
                    items: controller.items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    selectedItemBuilder: (BuildContext context) {
                      return controller.items.map<Widget>(
                        (String value) {
                          return Row(
                            children: [
                              Text(value),
                              GestureDetector(
                                onTap: () {
                                  controller.nullValue();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.close, size: 16),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Sort By',
                  style: semiBoldDefault.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    controller.sorts.length,
                    (index) => GestureDetector(
                      onTap: () {
                        controller.sort(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: controller.selectSort == index
                              ? ColorResources.primaryColor
                              : ColorResources.black5,
                        ),
                        child: Center(
                          child: Text(
                            controller.sorts[index],
                            style: regularDefault.copyWith(
                              color: controller.selectSort == index
                                  ? ColorResources.whiteColor
                                  : ColorResources.blackColor,
                            ),
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
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: size.width,
          child: FloatingActionButton(
            backgroundColor: ColorResources.primary75,
            onPressed: () {},
            child: Text(
              'Apply',
              style: semiBoldDefault.copyWith(
                color: ColorResources.whiteColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
