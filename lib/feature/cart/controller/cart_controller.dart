import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/core.dart';
import '../../feature.dart';

class CartController extends GetxController {
  ApiClient apiClient;
  CartController({required this.apiClient});
  var cartItems = <CartModel>[].obs;

  @override
  void onInit() {
    loadCart();
    loadFav();
    super.onInit();
  }

  void loadCart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? cartJson =
        preferences.getStringList(SharedPreferenceHelper.cart);
    if (cartJson != null) {
      cartItems.value =
          cartJson.map((item) => CartModel.fromJson(jsonDecode(item))).toList();
    }
  }

  void saveCart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> cartJson =
        cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await preferences.setStringList(SharedPreferenceHelper.cart, cartJson);
    update();
  }

  void loadFav() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? storedFavorites =
        prefs.getStringList(SharedPreferenceHelper.favCart);
    if (storedFavorites != null) {
      List<Product> favoriteProducts = storedFavorites
          .map((product) => Product.fromJson(jsonDecode(product)))
          .toList();
      for (var product in productList) {
        product.isFavorite.value =
            favoriteProducts.any((fav) => fav.id == product.id);
      }
      update();
    }
  }

  void saveFav() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favProducts = productList
        .where((product) => product.isFavorite.value)
        .map((product) => jsonEncode(product.toJson()))
        .toList();
    await prefs.setStringList(SharedPreferenceHelper.favCart, favProducts);
    update();
  }

  void addToCart(Product product) {
    if (product.stock > 0) {
      int index = cartItems.indexWhere((item) => item.product.id == product.id);
      if (index != -1) {
        cartItems[index].quantity++;
        product.decreaseStock(1);
      } else {
        cartItems.add(CartModel(product: product, quantity: 1));
        product.decreaseStock(1);
      }
    } else {
      Get.snackbar("Out of Stock", "${product.title} is not available");
    }
    saveCart();
    update();
  }

  /// Remove product from cart and restore stock
  void removeFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        product.increaseStock(1);
      } else {
        cartItems.removeAt(index);
        product.increaseStock(1);
      }
    }
    saveCart();
    update();
  }

  void removeonceFromCart(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      product.increaseStock(cartItems[index].quantity); // Restore full stock
      cartItems.removeAt(index); // Remove product from cart
    }
    saveCart();
    update();
  }

  void onFavo(Product product) async {
    product.toggleFavorite();
    saveFav();
    update();
  }

  /// Get total price
  // double get totalPrice => cartItems.fold(
  //     0, (sum, item) => sum + (item.product.price * item.quantity));
  double getItemTotalPrice(Product product) {
    int index = cartItems.indexWhere((item) => item.product.id == product.id);
    return index != -1
        ? cartItems[index].product.price * cartItems[index].quantity
        : 0;
  }

  bool isInCart(Product product) {
    return cartItems.any((p) => p.product.id == product.id);
  }

  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);
  int get totalProductTypes => cartItems.length;


  double get totalAmount => cartItems.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));

  void updateProductQty(Product product, int newQty) {
    int index = cartItems.indexWhere((p) => p.product.id == product.id);
    if (index != -1) {
      if (newQty > 0 && newQty <= product.stock) {
        cartItems[index].quantity = newQty;
        product.decreaseStock(newQty - cartItems[index].quantity);
        saveCart();
        update();
      } else {
        Get.snackbar("Invalid Quantity", "Please enter a valid quantity.");
      }
    }
    update();
  }

  List<Product> get favoriteProducts {
    return productList.where((product) => product.isFavorite.value).toList();
  }
  void clearCart() {
    for (var item in cartItems) {
      item.product.increaseStock(item.quantity);
    }
    cartItems.clear();
    saveCart();
    update();
  }

}
