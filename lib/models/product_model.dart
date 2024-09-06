class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.rating});

  factory ProductModel.fromjson(Map<String, dynamic> jsondata) {
    return ProductModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: (jsondata['price']),
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      rating: (jsondata['rating'] != null)
          ? RatingModel.fromjson(jsondata['rating'])
          : null,
    );
  }
  @override
  String toString() {
    return 'ProductModel (id :$id, title :$title, price :$price, description :$description, category :$category,image :$image, rating :$rating)';
  }
}

class RatingModel {
  final double rate;
  final double count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(Map<String, dynamic> jsondata) {
    return RatingModel(
      rate: (jsondata['rate'] as num).toDouble(),
      count: (jsondata['count'] as num).toDouble(),
    );
  }
  @override
  String toString() {
    return 'RatingModel (rate:$rate,count:$count)';
  }
}
