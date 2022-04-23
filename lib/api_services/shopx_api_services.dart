import 'package:getx/api_routes/api_routes.dart';
import 'package:getx/api_services/common_api.dart';
import 'package:getx/model/shopx_model.dart';

class ShopXApiServices {
  static Future<List<ShopXModel>?> getApiShopX() async {
    // http.Response response = await http.get(Uri.parse(ApiRoutes.shopX));
    //
    // if (response.statusCode == 200) {
    //   return shopXModelFromJson(response.body);
    // }

    var response =
        await API.apiHandler(url: ApiRoutes.shopX, apiType: ApiType.aGet);

    return shopXModelFromJson(response);
  }
}
