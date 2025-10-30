import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_navigate_button.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class UpdatProductPage extends StatefulWidget {
  UpdatProductPage({super.key});
  static const String pageId = 'updat page';

  @override
  State<UpdatProductPage> createState() => _UpdatProductPageState();
}

class _UpdatProductPageState extends State<UpdatProductPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    String? productName, desc, image, price;
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Colors.transparent, // to take the same scaffold color
          centerTitle: true,
          title: Text(
            'Update this product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (value) => productName = value,
                  text: 'Product name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) => price = value,
                  text: 'Price',
                  textInputType: TextInputType.number, // to get nubmers only
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) => desc = value,
                  text: 'description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (value) => image = value,
                  text: 'Image Url',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomNavigateButton(
                  buttonText: 'Update',
                  onTap: () {
                    isLoading = true;
                    setState(() {});

                    try {
                      updateProductMethod(
                          productName, price, desc, image, productModel);
                      print('Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProductMethod(String? productName, String? price, String? desc,
      String? image, ProductModel productModel) {
    UpdateProductService().updateProduct(
        id: productModel.id,
        title: productName == null ? productModel.title : productName!,
        price: price == null ? productModel.price.toString() : price!,
        description: desc == null ? productModel.description : desc!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
