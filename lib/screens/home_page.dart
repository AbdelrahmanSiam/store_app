import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/icon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String pageId = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "New Trend",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 65),
          child: FutureBuilder(
            future: GetAllProductService().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ProductModel> products =
                    snapshot.data as List<ProductModel>;
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.6,
                  ),
                  itemBuilder: (context, index) =>
                      IconCard(product: products[index]),
                  itemCount: products.length,
                );
              } else {
                return Center(child: Text("No data"));
              }
            },
          )),
    );
  }
}
