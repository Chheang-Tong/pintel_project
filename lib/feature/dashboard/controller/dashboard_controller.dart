import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<String> mode = [
    'All',
    'Ecommerce',
    'Fashion',
    'Food',
    'Vegetable',
  ];

  List<Map<String, String>> store = [
    {
      "store_name": "Tos Tenh",
      "logo": "assets/image/fashion.png",
      "type": "Fashion",
      "address": "Tourl Kork. Phnom Penh",
    },
    {
      "store_name": "Cooking Breli",
      "logo": "assets/image/fashion.png",
      "type": "Food",
      "address": "Posenchey. Phnom Penh",
    },
    {
      "store_name": "P Perchi",
      "logo": "assets/image/fashion.png",
      "type": "Fashion",
      "address": "7 Makara. Phnom Penh",
    },
    {
      "store_name": "Rotinely HOL",
      "logo": "assets/image/fashion.png",
      "type": "Vegetable",
      "address": "DangKor. Phnom Penh",
    },
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
