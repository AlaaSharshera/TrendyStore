import 'package:ecommerce_api/components/custom_textfield.dart';
import 'package:ecommerce_api/components/custombutton.dart';
import 'package:ecommerce_api/helper/showsnackbar.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/services/update_product_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;
  bool isLoading = false;
  String? price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Update Product"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CustomTextField(
                    onchange: (data) {
                      productName = data;
                    },
                    hinttext: "product name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onchange: (data) {
                      description = data;
                    },
                    hinttext: "description",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onchange: (data) {
                      price = data;
                    },
                    hinttext: "price",
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(
                    hinttext: "image",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Custombutton(
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      buttontext: "Update product",
                      ontap: () {
                        isLoading = true;
                        setState(() {});
                        try {
                          UpdateProductService().updateProductService(
                              id: (product.id).toString(),
                              title: (productName == null)
                                  ? product.title
                                  : productName!,
                              price: (price == null)
                                  ? (product.price.toString())
                                  : price!,
                              des: (description == null)
                                  ? product.description
                                  : description!,
                              image: (image == null) ? product.image : image!,
                              category: product.category);
                          showSnackBar(context, 'Product has been updated');
                        } catch (e) {
                          print(e.toString());
                        }
                        isLoading = false;
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
