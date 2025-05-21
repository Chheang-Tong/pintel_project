import 'package:flutter/material.dart';
import 'package:pintel_project/core/core.dart';
import 'package:pintel_project/feature/feature.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  late TabController tabController;
  late ScrollController controller = ScrollController();
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
    tabController = TabController(length: 5, vsync: this);
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: buildSliverScrollView(),
    );
  }

  Widget buildSliverScrollView() {
    return CustomScrollView(
      controller: controller,
      slivers: [
        appBar(),
        if (selectedIndex == 0) PostWidget(),
        if (selectedIndex == 1) ServiceWidget(),
        if (selectedIndex == 2) AboutWidget(),
        if (selectedIndex == 3) MapWidget(),
        if (selectedIndex == 4) ContactWidget(),
      ],
    );
  }

  Widget appBar() {
    return AppBars(
      storeName: 'Tos Tenh',
      tile:
          'Lorem Ipsum is simply dummy text of the printing and  typesetting indus',
      context: context,
      length: list.length,
      text: list,
      isCollapsed: isCollapsed,
      expandedHeight: Dimensions.expandedHeights,
      collapsedHeight: Dimensions.collapsedHeights,
      tabController: tabController,
      onCollapsed: onCollapsed,
      onTap: (int index) {
        setState(() => selectedIndex = index);
      },
      selectedIndex: selectedIndex,
      url:
          'https://i.pinimg.com/736x/95/e5/e1/95e5e1e21398e7ff7585bda334f535e9.jpg',
    );
  }
}
