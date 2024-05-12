import 'package:get/get.dart';
import 'package:shopping_app/controller/home_screen_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
