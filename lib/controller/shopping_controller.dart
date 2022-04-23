import 'package:get/get.dart';
import 'package:getx/api_services/shopx_api_services.dart';
import 'package:getx/model/shopx_model.dart';

class ShoppingController extends GetxController {
  var isLoading = true.obs;
  var productsList = <ShopXModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      var product = await ShopXApiServices.getApiShopX();
      if (product != null) {
        productsList.value = product;
      }
    } finally {}
  }
}
