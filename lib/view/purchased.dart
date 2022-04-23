import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/cart_controller.dart';

class Purchased extends StatelessWidget {
  Purchased({Key? key}) : super(key: key);

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<CartController>(builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.network(
                            "${controller.cartItems[index].imageLink}",
                            scale: 1.7,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.cartItems[index].name}",
                                  maxLines: 2,
                                ),
                                Text(
                                  "${controller.cartItems[index].description}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.removedCartItem(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Total Amount \$${controller.totalAmount}"),
            SizedBox(
              height: 10,
            ),
            Text("Total Product ${controller.totalItem}"),
            SizedBox(
              height: 50,
            ),
          ],
        );
      }),
    );
  }
}
