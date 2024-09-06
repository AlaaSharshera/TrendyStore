import 'package:ecommerce_api/models/product_model.dart';
import 'package:ecommerce_api/helper/api.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().getService(url: 'https://fakestoreapi.com/products');
    List<ProductModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(ProductModel.fromjson(data[i]));
    }
    return products;
  }
}
