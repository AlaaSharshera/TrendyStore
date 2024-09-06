import 'package:ecommerce_api/helper/api.dart';
import 'package:ecommerce_api/models/product_model.dart';

class AddProducetService {
  Future<ProductModel> addProductService(
      {required String title,
      required String price,
      required String des,
      required String image,
      required String category}) async {
    Map<String, dynamic> productdata =
        await Api().potService(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': des,
      'category': category,
      'image': image,
    });
    ProductModel product = ProductModel.fromjson(productdata);
    return product;
  }
}
