import 'package:ecommerce_api/helper/api.dart';

class GetAllCategories {
  Future<List<String>> getAllCategories() async {
    List<dynamic> categoriesData = await Api()
        .getService(url: 'https://fakestoreapi.com/products/categories');
    List<String> categories = [];
    for (int i = 0; i < categoriesData.length; i++) {
      categories.add(categoriesData[i].toString());
    }
    return categories;
  }
}
