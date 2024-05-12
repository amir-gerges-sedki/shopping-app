import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/category_screen_controller.dart';
import 'package:shopping_app/view/screens/home_screen.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  CategoryCard({required this.title, required this.imagePath, super.key});
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (_, item) {
            return InkWell(
              onTap: () {
                // controller
                //     .getAllProducts(controller.categoryName[item]);
                Get.to(HomeScreen());
              },
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 3,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.fill)),
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomText(
                                  title: title,
                                  color: Colors.black,
                                  fontSize: 18,
                                  overflow: TextOverflow.clip)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, item) {
            return const Divider(thickness: 2, color: Colors.amber);
          },
          itemCount: 1),
    );
  }
}


// 