import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';
import 'package:pintel_project/feature/feature.dart';

class CreateAddress extends StatefulWidget {
  const CreateAddress({super.key});
  @override
  State<CreateAddress> createState() => _CreateAddressState();
}

class _CreateAddressState extends State<CreateAddress> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Address'),
      ),
      // backgroundColor: ColorResources.blackColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.largeMagin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.space16,
                  bottom: Dimensions.space8,
                ),
                child: Row(
                  children: [
                    Text(
                      'Address Name',
                      style: semiBoldMediumLarge,
                    ),
                    Text(
                      ' *',
                      style: semiBoldMediumLarge.copyWith(
                        color: ColorResources.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              CustomTextField(
                hintText: 'Enter Name',
                onChanged: (onChanged) {},
                fillColor: ColorResources.black5,
                noneBorder: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimensions.space16,
                  bottom: Dimensions.space8,
                ),
                child: Row(
                  children: [
                    Text(
                      'Delivery Address',
                      style: semiBoldMediumLarge,
                    ),
                    Text(
                      ' *',
                      style: semiBoldMediumLarge.copyWith(
                        color: ColorResources.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Enter Your Address',
                      onChanged: (onChanged) {},
                      fillColor: ColorResources.black5,
                      noneBorder: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorResources.black10,
                      ),
                      child: SvgPicture.asset('assets/image/marker.svg'),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: 167,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorResources.white10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Location(move: false, showbtn: false),
                ),
              ),
              SizedBox(height: Dimensions.space19),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Default Address',
                          style: semiBoldMediumLarge,
                        ),
                        Text('Use this address for default when order'),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 40,
                        child: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              value: isActive,
                              offLabelColor: ColorResources.errorColor,
                              onLabelColor: ColorResources.successColor,
                              onChanged: (onChanged) {
                                setState(() {
                                  isActive = onChanged;
                                });
                              }),
                        ),
                      ),
                      Text(
                        isActive ? 'ON' : 'OFF',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
