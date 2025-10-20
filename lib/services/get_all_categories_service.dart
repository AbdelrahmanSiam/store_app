import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helpers/api_helper.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    // < > => return type is dynamic or String,dynamic only
    List<dynamic> data = await ApiHelper().get(url: "https://fakestoreapi.com/products/categories");

      return data;
  }
}
