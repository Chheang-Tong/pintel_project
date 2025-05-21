import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<String> mode = [
    'All',
    'Ecommerce',
    'Fashion',
    'Food',
    'Vegetable',
  ];
  
  int select = -1;
  bool isSelect = false;

  selectBool() {
    isSelect = !isSelect;
    update();
  }

  selectIndexs(int index) {
    select = index;
    update();
  }

  selectIndex() {
    select = -1;
    update();
  }
}
