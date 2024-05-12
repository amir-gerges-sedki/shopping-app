import 'package:get/get.dart';
import 'package:shopping_app/model/poducts_model.dart';

class CartScreenController extends GetxController {
  var productsMap = {}.obs;
  addProduct(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
    } else {
      productsMap[productModel] = 1;
    }
  }

  reduceProduct(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
  }

  removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element);
}
