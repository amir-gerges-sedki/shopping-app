import 'package:get/get.dart';
import 'package:shopping_app/model/poducts_model.dart';
import 'package:shopping_app/services/product_category_services.dart';

class CategoryController extends GetxController {
  var categoryName = <ProductModel>[].obs;
  var productcategoryName = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoriesData = [
    {'title': 'electronics', 'image': 'assets/search1.png'},
    {'title': 'jewelery', 'image': 'assets/search1.png'},
    {'title': 'men\'s clothing', 'image': 'assets/search1.png'},
    {'title': 'women\'s clothing', 'image': 'assets/search1.png'},
  ];

  void getAllProducts(categoryName) async {
    var productsCategory =
        await ProductCategoryServices.getProductsCategory(categoryName);
    try {
      isLoading.value = true;
      if (productsCategory.isNotEmpty) {
        productcategoryName.addAll(productsCategory);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
