import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService {
  // the result of category name may be more than one model (list)
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
   List<dynamic> data = await ApiHelper().get(url: "https://fakestoreapi.com/products/category/$categoryName");

      List<ProductModel> list = [];
      for (int i = 0; i < data.length; i++) {
        list.add(ProductModel.fromjson(data[i]));
      }
      return list;
  }
}
