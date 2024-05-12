import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/product_controller.dart';

class CustomFormText extends StatelessWidget {
  CustomFormText({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
              controller: controller.searchText,
              onChanged: (productName) {
                controller.search(productName);
              },
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: controller.searchText.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clearSearchText();
                          },
                          icon: const Icon(Icons.close))
                      : null,
                  hintText: 'search ',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true)));
    });
  }
}
