import 'package:get/get.dart';
import 'package:getx/model/shopx_model.dart';

class CartController extends GetxController {
  var cartItems = <ShopXModel>[].obs;
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + double.parse(item.price!));
  int get totalItem => cartItems.length;

  addCartItem(ShopXModel product) {
    cartItems.add(product);
  }

  removedCartItem(int index) {
    cartItems.removeAt(index);
  }
}
