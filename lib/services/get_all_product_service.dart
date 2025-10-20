import 'dart:convert';
import 'package:http/http.dart' as http; // using allias (as) to can use it
import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  // This function will return all products from API it as List with maps but we will convert these maps to models
  Future<List<ProductModel>> getAllProduct() async {
   List<dynamic> data = await ApiHelper().get(url: 'https://fakestoreapi.com/products');

      List<ProductModel> productList = []; // new list (list of models)

      // we will make for loop to make this convert
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromjson(data[i]));
      }

      return productList;
  }
}


/*
import 'dart:convert';
import 'package:http/http.dart' as http; // using allias (as) to can use it
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  // This function will return all products from API it as List with maps but we will convert these maps to models 
  Future<List<ProductModel>> getAllProduct() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
  List<dynamic> data = jsonDecode(
      response.body); // we need to convert it to list of model into next step
  List<ProductModel> productList = []; // new list (list of models)
  
  // we will make for loop to make this convert
  for (int i = 0; i < data.length; i++) {
    productList.add(ProductModel.fromjson(data[i]));
  }
  
  return productList;
}
else{
  throw Exception(
          "There is a status code exception ${response.statusCode}");
}
  }
}
*/