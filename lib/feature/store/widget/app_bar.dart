// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AppBars extends SliverAppBar {
  final BuildContext context;
  final String url;
  final bool isCollapsed;
  final String storeName;
  final String tile;
  @override
  final double expandedHeight;
  @override
  final double collapsedHeight;
  final int length;
  final List<String> text;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final int selectedIndex;

  const AppBars({
    super.key,
    required this.url,
    required this.storeName,
    required this.tile,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.text,
    required this.length,
    required this.onCollapsed,
    required this.tabController,
    required this.onTap,
    required this.selectedIndex,
  }) : super(
          elevation: 4.0,
          pinned: true,
          forceElevated: true,
        );

  @override
  Color? get backgroundColor => ColorResources.bgColor;

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(6),
      child: Container(
        color: ColorResources.transparentColor,
        width: MediaQuery.of(context).size.width,
        child: TabBar(
          padding: EdgeInsets.symmetric(horizontal: 8),
          labelColor: Colors.black,
          unselectedLabelColor: ColorResources.black75,
          overlayColor: MaterialStateProperty.all(
            ColorResources.transparentColor,
          ),
          splashFactory: NoSplash.splashFactory,
          indicator: BoxDecoration(
            color: ColorResources.black10,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 8),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1,
          indicatorPadding: EdgeInsets.symmetric(vertical: 6),
          automaticIndicatorColorAdjustment: false,
          controller: tabController,
          tabs: [
            ...List.generate(
              length,
              (index) => Tab(
                child: Text(
                  text[index],
                ),
              ),
            )
          ],
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get leading {
    return Center();
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 55,
                ),
                height: 151,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 219, 210, 210),
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -50,
                      child: Container(
                        height: 100,
                        width: 100,
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
                    ),
                  ],
                ),
              ),
              Text(
                storeName,
                style: boldLarge.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                tile,
                style: regularLarge.copyWith(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      },
    );
  }
}
