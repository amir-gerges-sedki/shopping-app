import 'package:get/get.dart';
import 'package:shopping_app/view/screens/category_screen.dart';
import 'package:shopping_app/view/screens/favorite_screen.dart';
import 'package:shopping_app/view/screens/home_screen.dart';
import 'package:shopping_app/view/screens/cart_screen.dart';

class HomeController extends GetxController {
  RxInt currentItem = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScren(),
    FavoriteScreen(),
    CartScrenn(),
  ].obs;

  final titeScreen = const [
    'SHOPPING APP',
    'Categories',
    'MyFavorite',
    'My Cart',
  ];
}
