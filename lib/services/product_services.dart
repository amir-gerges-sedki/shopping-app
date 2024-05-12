import 'package:http/http.dart' as http;
import 'package:shopping_app/model/poducts_model.dart';

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
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
