import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/model/poducts_model.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class CartProdut extends StatelessWidget {
  CartProdut({
    super.key,
    required this.productModel,
    required this.counter,
  });
  final ProductModel productModel;
  final int counter;
  final controller = Get.find<CartScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 20),
              width: 140,
              height: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(productModel.image),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              height: 30,
              width: 55,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: CustomText(
                  title: productModel.price.toString(),
                  color: Colors.black,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              width: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.removeOneProduct(productModel);
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 35,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.addProduct(productModel);
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      iconSize: 35,
                    ),
                    CustomText(
                        title: '$counter',
                        color: Colors.black,
                        fontSize: 25,
                        overflow: TextOverflow.visible),
                    IconButton(
                      onPressed: () {
                        controller.reduceProduct(productModel);
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                      iconSize: 35,
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
