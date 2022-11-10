import 'package:ecommerc/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../../model/productModel.dart';

class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    var res = await http.get(Uri.parse("$baseUrl/products"));
    if (res.statusCode == 200) {
      var jsonData = res.body;
      //from the model
      return productModelFromJson(jsonData);
    }else{
      return throw Exception("Failed to load data");
    }
  }
}
