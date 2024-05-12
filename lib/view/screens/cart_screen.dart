import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/view/widgets/cart_product.dart';
import 'package:shopping_app/view/widgets/cart_product_total.dart';

class CartScrenn extends StatelessWidget {
  CartScrenn({super.key});
  final controller = Get.find<CartScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.productsMap.isEmpty) {
        return Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 3),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.amber,
              size: 50,
            ),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 630,
                child: ListView.separated(
                    itemBuilder: (context, item) {
                      return CartProdut(
                        productModel:
                            controller.productsMap.keys.toList()[item],
                        counter: controller.productsMap.values.toList()[item],
                      );
                    },
                    separatorBuilder: (_, item) {
                      return const Divider(
                        color: Colors.amber,
                      );
                    },
                    itemCount: controller.productsMap.length),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CartProductTotal(),
              )
            ],
          ),
        );
      }
    }));
  }
}
