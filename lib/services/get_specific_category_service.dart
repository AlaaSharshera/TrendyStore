import 'package:ecommerce_api/helper/api.dart';
import 'package:ecommerce_api/models/product_model.dart';

class GetSpecificCategoryService {
  Future<List<ProductModel>> getSpecificCategoryService(
      {required String categoryName}) async {
    List<dynamic> data = await Api().getService(
        url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> products = [];
    for (int i = 0; i < data.length; i++) {
      products.add(ProductModel.fromjson(data[i]));
    }

    return products;
  }
}
