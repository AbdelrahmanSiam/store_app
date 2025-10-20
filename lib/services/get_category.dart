import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class GetCategory {
  // the result of category name may be more than one model (list)
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    http.Response response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/$categoryName"));

    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> list = [];

    for (int i = 0; i < data.length; i++) {
      list.add(ProductModel.fromjson(data[i]));
    }

    return list;
  }
}
