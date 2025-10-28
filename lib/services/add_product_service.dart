import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await ApiHelper().post(url: "https://fakestoreapi.com/products", body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });

    return ProductModel.fromjson(data);
  }
}
