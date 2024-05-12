import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/category_screen_controller.dart';
import 'package:shopping_app/view/widgets/category_card.dart';

class CategoryScren extends StatelessWidget {
  CategoryScren({super.key});
  final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.categoriesData
              .map(
                  (e) => CategoryCard(title: e['title'], imagePath: e['image']))
              .toList()),
    ));
  }
}
