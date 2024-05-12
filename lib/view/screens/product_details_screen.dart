import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/model/poducts_model.dart';
import 'package:shopping_app/view/widgets/add_cart.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({
    super.key,
    required this.productModel,
    required this.productId,
  });
  final controller = Get.find<ProductController>();
  final controllerr = Get.find<CartScreenController>();
  final ProductModel productModel;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(child: Obx(() {
                  return Column(children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 545,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Image.network(productModel.image),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back))
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomText(
                                title: productModel.title,
                                color: Colors.black,
                                fontSize: 22,
                                overflow: TextOverflow.ellipsis),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.isFavorite(productId)
                                    ? controller.removeFromFavorite(productId)
                                    : controller.addToFavorite(productId);
                              },
                              icon: !controller.isFavorite(productId)
                                  ? const Icon(Icons.favorite_border)
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                        ]),
                    Row(children: [
                      CustomText(
                          title:
                              '${controller.productList[productId - 1].rating.rate}',
                          color: Colors.black,
                          fontSize: 20,
                          overflow: TextOverflow.clip),
                      const SizedBox(width: 10),
                      RatingBarIndicator(
                        rating:
                            controller.productList[productId - 1].rating.rate,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                    ]),
                    ReadMoreText(
                      controller.productList[productId - 1].description,
                      preDataText: controller.productList[productId - 1].title,
                      preDataTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                      trimMode: TrimMode.Line,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      trimCollapsedText: '...Show more',
                      moreStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      trimExpandedText: ' show less',
                      lessStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(height: 50),
                    AddCartProduct(
                        price: controller.productList[productId - 1].price,
                        onTap: controllerr.addProduct(productModel))
                  ]);
                })))));
  }
}
