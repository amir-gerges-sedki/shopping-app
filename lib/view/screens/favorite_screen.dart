import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.favoriteList.isEmpty) {
        return const Center(
          child: Text('data'),
        );
      } else {
        return ListView.separated(
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                            width: 120,
                            height: 140,
                            child: Image.network(
                                controller.favoriteList[item].image,
                                fit: BoxFit.cover),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                                overflow: TextOverflow.ellipsis,
                                title: controller.favoriteList[item].title,
                                color: Colors.black,
                                fontSize: 20),
                            CustomText(
                                overflow: TextOverflow.visible,
                                title:
                                    '${controller.favoriteList[item].price}\$',
                                color: Colors.black,
                                fontSize: 22),
                            Container(
                              width: 60,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                      overflow: TextOverflow.visible,
                                      title:
                                          '${controller.favoriteList[item].rating.rate}',
                                      color: Colors.black,
                                      fontSize: 17),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            controller.removeFromFavorite(
                                controller.favoriteList[item].id);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, item) {
              return const Divider(thickness: 2, color: Colors.amber);
            },
            itemCount: controller.favoriteList.length);
      }
    }));
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopping_app/controller/product_controller.dart';
// import 'package:shopping_app/view/widgets/card_product.dart';

// class FavoriteScreen extends StatelessWidget {
//   FavoriteScreen({super.key});
//   final controller = Get.find<ProductController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Scaffold(
//         body: ListView.separated(
//             itemBuilder: (_, item) {
//               return CustomCardProduct(
//                 rate: controller.productList[item].rating.rate,
//                 image: controller.productList[item].image,
//                 price: controller.productList[item].price,
//               );
//             },
//             separatorBuilder: (_, item) {
//               return const Divider(thickness: 2, color: Colors.amber);
//             },
//             itemCount: 10),
//       );
//     });
//   }
// }
