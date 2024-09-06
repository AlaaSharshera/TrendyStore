import 'package:ecommerce_api/helper/api.dart';
import 'package:ecommerce_api/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProductService({
    required String id,
    required String title,
    required String price,
    required String des,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> productdata = await Api()
        .putService(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': des,
      'image': image,
      'category': category
    });
    ProductModel product = ProductModel.fromjson(productdata);
    return product;
  }
}
