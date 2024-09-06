import 'package:ecommerce_api/components/customproduct_container.dart';
import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/services/get_specific_category_service.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({required this.categoryName, super.key});
  static String id = 'productspage';
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          '$categoryName Collection',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: GetSpecificCategoryService()
              .getSpecificCategoryService(categoryName: categoryName),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      return CustomProductContainer(product: products[index]);
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
