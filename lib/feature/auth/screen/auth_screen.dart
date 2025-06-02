import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/common/common.dart';
import 'package:pintel_project/core/core.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF200309),
                    Color(0xFF8F3749),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -37,
                    left: -107,
                    child: Container(
                      width: size.width * 0.95,
                      height: size.width * 0.95,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.white10,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -152,
                    left: -222,
                    child: Container(
                      width: size.width * 1.5,
                      height: size.width * 1.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.white5,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 65,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorResources.whiteColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 116,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          height: 83,
                          width: 83,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorResources.white45,
                              width: 5,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/image/fashion.png'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tos Tenh',
                                style: boldOverLarge.copyWith(
                                  color: ColorResources.whiteColor,
                                ),
                              ),
                              Text(
                                "Whether you're back for more or just getting started, log in or create an account to explore tasty deals and fresh finds!",
                                style: regularDefault.copyWith(
                                  color: ColorResources.whiteColor,
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: ColorResources.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.largePadding,
                              // vertical: Dimensions.space23,
                            ),
                            child: Text(
                              'Log In',
                              style: boldMegaLarge.copyWith(
                                color: ColorResources.blackColor,
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            DefaultTabController(
              length: 2, // number of tabs
              animationDuration: Duration(milliseconds: 300),
              child: Container(
                width: size.width,
                height: size.height * 0.7,
                color: ColorResources.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: size.width * 0.5,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: 'Phone Number'),
                          Tab(text: 'Email'),
                        ],
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelColor: ColorResources.blackColor,
                        automaticIndicatorColorAdjustment: true,
                        dividerHeight: 0,
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.only(left: 16),
                        indicatorPadding: EdgeInsets.symmetric(vertical: 6),
                        splashFactory: NoSplash.splashFactory,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorAnimation: TabIndicatorAnimation.linear,
                        indicator: BoxDecoration(
                          color: ColorResources.whiteColor,
                          border: Border(
                            bottom: BorderSide(
                              color: ColorResources.blackColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: currentIndex == 0 ? 1 : 2,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          PhoneNumber(),
                          Email(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text('data'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.transparentColor,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.largeMagin,
          vertical: Dimensions.defaultMagin,
        ),
        child: Column(
          children: [
            CustomTextField(
              onChanged: (onChanged) {},
              hintText: 'Phone Number',
              inputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              noneBorder: true,
              fillColor: ColorResources.black5,
            ),
          ],
        ),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.transparentColor,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.largeMagin,
          vertical: Dimensions.defaultMagin,
        ),
        child: Column(
          children: [
            CustomTextField(
              onChanged: (onChanged) {},
              hintText: 'Phone Number',
              inputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              noneBorder: true,
              fillColor: ColorResources.black5,
            ),
            SizedBox(height: Dimensions.space24),
            CustomTextField(
              onChanged: (onChanged) {},
              hintText: 'Phone Number',
              inputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              noneBorder: true,
              fillColor: ColorResources.black5,
            ),
          ],
        ),
      ),
    );
  }
}
