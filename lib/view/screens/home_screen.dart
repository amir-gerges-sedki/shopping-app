import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/view/screens/product_details_screen.dart';
import 'package:shopping_app/view/widgets/card_product.dart';
import 'package:shopping_app/view/widgets/custom_search_form.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<ProductController>();
  final controllerr = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        );
      } else {
        return Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        overflow: TextOverflow.visible,
                        title: 'Find Your',
                        color: Colors.black,
                        fontSize: 20),
                    const SizedBox(
                      height: 5,
                    ),
                    const CustomText(
                        overflow: TextOverflow.visible,
                        title: 'INSPIRATION',
                        color: Colors.black,
                        fontSize: 30),
                    const SizedBox(height: 2),
                    CustomFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                  overflow: TextOverflow.visible,
                  title: 'Products',
                  color: Colors.black,
                  fontSize: 22),
            ),
            Expanded(
                child: controller.searchList.isEmpty &&
                        controller.searchText.text.isNotEmpty
                    ? Image.asset(
                        'assets/search1.png',
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : GridView.builder(
                        itemCount: controller.searchList.isEmpty
                            ? controller.productList.length
                            : controller.searchList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 9.0,
                          crossAxisSpacing: 6.0,
                          childAspectRatio: .8,
                        ),
                        itemBuilder: (context, item) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 8.0,
                                      color: Colors.grey.withOpacity(0.2))
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Obx(() {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.isFavorite(controller
                                                    .productList[item].id)
                                                ? controller.removeFromFavorite(
                                                    controller
                                                        .productList[item].id)
                                                : controller.addToFavorite(
                                                    controller
                                                        .productList[item].id);
                                          },
                                          icon: !controller.isFavorite(
                                                  controller
                                                      .productList[item].id)
                                              ? const Icon(
                                                  Icons.favorite_border)
                                              : AnimatedContainer(
                                                  duration: const Duration(
                                                      seconds: 2),
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  ),
                                                )),
                                      IconButton(
                                          onPressed: () {
                                            controllerr.addProduct(
                                                controller.productList[item]);
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  );
                                }),
                                if (controller.searchList.isEmpty)
                                  CustomCardProduct(
                                    rate: controller
                                        .productList[item].rating.rate,
                                    image: controller.productList[item].image,
                                    price: controller.productList[item].price,
                                    onTap: () {
                                      Get.to(() => ProductDetails(
                                            productModel:
                                                controller.productList[item],
                                            productId:
                                                controller.productList[item].id,
                                          ));
                                    },
                                  )
                                else
                                  CustomCardProduct(
                                    rate:
                                        controller.searchList[item].rating.rate,
                                    image: controller.searchList[item].image,
                                    price: controller.searchList[item].price,
                                    onTap: () {
                                      Get.to(() => ProductDetails(
                                            productModel:
                                                controller.searchList[item],
                                            productId:
                                                controller.searchList[item].id,
                                          ));
                                    },
                                  )
                              ],
                            ),
                          );
                        })),
          ],
        ));
      }
    });
  }
}
