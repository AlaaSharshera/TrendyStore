import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/screens/update_product_page.dart';
import 'package:flutter/material.dart';

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({required this.product, super.key});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 121,
        width: 97,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 2),
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(height: 110, image: NetworkImage(product.image)),
            Text(
              product.title.substring(0, 8),
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              " ${product.price} \$",
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
