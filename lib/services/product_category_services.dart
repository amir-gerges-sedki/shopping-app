import 'package:http/http.dart' as http;
import 'package:shopping_app/model/poducts_model.dart';

class ProductCategoryServices {
  static Future<List<ProductModel>> getProductsCategory(
      String categoryName) async {
    try {
      var response = await http.get(Uri.parse(
          'https://fakestoreapi.com/products/category/$categoryName'));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        throw Exception('No Data');
      }
    } catch (e) {
      return [];
    }
  }
}
