import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class CartProductTotal extends StatelessWidget {
  CartProductTotal({super.key});
  final controller = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const CustomText(
                title: 'Total',
                color: Colors.black,
                fontSize: 20,
                overflow: TextOverflow.clip,
              ),
              CustomText(
                title: '${controller.total.toStringAsFixed(2)}',
                color: Colors.black,
                fontSize: 16,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          Ink(
            child: Container(
              padding: const EdgeInsets.only(left: 60),
              width: 270,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  CustomText(
                    title: 'Check Out',
                    color: Colors.black,
                    fontSize: 22,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
