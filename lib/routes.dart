import 'package:get/get.dart';
import 'package:shopping_app/utils/mybinding.dart';
import 'package:shopping_app/utils/product_binding.dart';
import 'package:shopping_app/view/screens/favorite_screen.dart';
import 'package:shopping_app/view/screens/homepage.dart';
import 'package:shopping_app/view/screens/cart_screen.dart';
import 'package:shopping_app/view/screens/onboarding_one_screen.dart';

class AppRoutes {
  static const onBoarding = '/onBoarding';
  static const homePage = '/homePage';
  static const favourite = '/favourite';
  static const cart = '/cart';
  static const productDetails = '/productDetails';
  static const categoryScreen = '/categoryScreen';
}

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.onBoarding, page: (() => const OnBoarding())),
  GetPage(
    name: AppRoutes.cart,
    page: (() => CartScrenn()),
    bindings: [ProductBinding(), MyBinding()],
  ),
  GetPage(
    name: AppRoutes.favourite,
    page: (() => FavoriteScreen()),
    binding: ProductBinding(),
  ),
  GetPage(name: AppRoutes.homePage, page: (() => HomePage()), bindings: [
    ProductBinding(),
    MyBinding(),
  ]),
];
