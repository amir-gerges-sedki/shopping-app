import 'package:get/get.dart';
import 'package:shopping_app/controller/cart_screen_controller.dart';
import 'package:shopping_app/controller/category_screen_controller.dart';
import 'package:shopping_app/controller/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartScreenController());
    Get.lazyPut(() => CategoryController());
  }
}
