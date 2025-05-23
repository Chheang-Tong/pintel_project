import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController controller = ScrollController();
  bool isCollapsed = false;
  late TabController tabController;
  int selectedIndex = 0;
  List<String> list = [
    'Post',
    'Service',
    'About',
    'Map',
    'Contact',
  ];
  @override
  void initState() {
    tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  void onCollapsed(bool value) {
    if (isCollapsed == value) return;
    setState(
      () => isCollapsed = value,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorResources.black10,
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarBrightness: Brightness.dark,
          //   ),
          //   expandedHeight: 275.0,
          //   backgroundColor: ColorResources.primaryColor,
          //   elevation: 50.0,
          //   stretch: true,
          //   pinned: true,
          //   // floating: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text(
          //       'Star Wars: The Last Jedi',
          //       style: TextStyle(
          //         color: ColorResources.whiteColor,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16,
          //       ),
          //     ),
          //     centerTitle: true,
          //     titlePadding: EdgeInsets.only(bottom: 25),
          //     background: Image.network(
          //       'https://i.pinimg.com/736x/37/1d/97/371d97f08f75a472b5ae37c217913816.jpg',
          //       fit: BoxFit.cover,
          //     ),
          //     stretchModes: [
          //       StretchMode.blurBackground,
          //       StretchMode.zoomBackground,
          //     ],
          //     collapseMode: CollapseMode.parallax,
          //   ),
          //   leadingWidth: 80,
          //   leading: IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //     ),
          //   ),
          //   actions: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.cast,
          //       ),
          //     ),
          //   ],
          // ),
          Appbars(
            storeName: 'Tos Tenh',
            tile:
                'Lorem Ipsum is simply dummy text of the printing and  typesetting indus',
            context: context,
            length: list.length,
            text: list,
            isCollapsed: isCollapsed,
            expandedHeight: 200,
            collapsedHeight: 100,
            tabController: tabController,
            onCollapsed: onCollapsed,
            onTap: (int index) {
              setState(() => selectedIndex = index);
             
            },
            selectedIndex: selectedIndex,
            url:
                'https://i.pinimg.com/736x/95/e5/e1/95e5e1e21398e7ff7585bda334f535e9.jpg',
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: ColorResources.black10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          height: 25,
                          margin: EdgeInsets.only(top: 4),
                          // padding: EdgeInsets.only(left: 0),
                          child: TabBar(
                            labelPadding: EdgeInsets.all(0),
                            indicatorPadding: EdgeInsets.all(0),
                            labelColor: ColorResources.black25,
                            unselectedLabelColor: ColorResources.black10,
                            indicatorWeight: 2,
                            // dividerHeight: 0,
                            labelStyle: semiBoldDefault,
                            unselectedLabelStyle: semiBoldDefault,
                            indicator: RoundedRectangleTabIndicator(
                              color: ColorResources.black10,
                              weight: 3,
                              width: size.width / 3,
                            ),
                            tabs: [
                              Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: size.width / 3,
                                  child: Text(
                                    'More Like This',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: size.width / 3,
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: size.width / 3,
                                  child: Text(
                                    'Comment',
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.55,
                          child: TabBarView(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 800),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Appbars extends SliverAppBar {
  final BuildContext context;
  final String url;
  final bool isCollapsed;
  final String storeName;
  final String tile;
  @override
  // ignore: overridden_fields
  final double expandedHeight;
  @override
  // ignore: overridden_fields
  final double collapsedHeight;
  final int length;
  final List<String> text;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;
  final int selectedIndex;

  const Appbars({
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
  Color? get backgroundColor => ColorResources.primaryColor;

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: ColorResources.transparentColor,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
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
          ],
        ),
      ),
    );
  }

  @override
  Widget? get leading {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: ColorResources.blackColor,
      ),
    );
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
            children: [],
          ),
        );
      },
    );
  }
}

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator({
    required Color color,
    required double weight,
    required double width,
    double radius = 8.0,
  }) : _painter = _RoundedRectanglePainter(color, weight, width, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RoundedRectanglePainter extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;
  final double radius;

  _RoundedRectanglePainter(Color color, this.weight, this.width, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    // final Offset customOffset =
    //     offset + Offset(0, config.size!.height - weight);
    final Offset customOffset1 = offset +
        Offset((config.size!.width - width) / 2, config.size!.height - weight);
    final Rect rect = customOffset1 & Size(width, weight);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    // final RRect mrRect = RRect.fromRectXY(rect, weight, weight);
    canvas.drawRRect(rRect, _paint);
  }
}
