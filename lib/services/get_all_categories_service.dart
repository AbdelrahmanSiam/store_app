import 'dart:convert';

import 'package:http/http.dart' as http;

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {  // < > => return type is dynamic or String,dynamic only
    http.Response response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));

    if (response.statusCode == 200) {
  List<dynamic> data = jsonDecode(response.body);
  
  return data;
}
else{
  throw Exception(
          "There is a status code exception ${response.statusCode}");
}
  }
}
