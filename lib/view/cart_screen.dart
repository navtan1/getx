import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/cart_controller.dart';
import 'package:getx/controller/shopping_controller.dart';
import 'package:getx/view/purchased.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  ShoppingController shoppingController = Get.put(ShoppingController());
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => Purchased());
                  },
                  icon: Icon(Icons.shopping_cart)),
              Positioned(
                right: 5,
                child: Obx(() => Text("${cartController.totalItem}")),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          GetX<ShoppingController>(
            builder: (controller) => Expanded(
              child: ListView.builder(
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "${controller.productsList[index].imageLink}",
                                scale: 2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.productsList[index].name}",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      textScaleFactor: 0.8,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${controller.productsList[index].description}",
                                      style: TextStyle(fontSize: 16),
                                      maxLines: 2,
                                      textScaleFactor: 0.8,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "\$${controller.productsList[index].price}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addCartItem(controller.productsList[index]);
                            },
                            child: Text("Add To Cart"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
