import 'package:ecommerce_api/components/customcontainer.dart';
import 'package:ecommerce_api/models/container_model.dart';
import 'package:ecommerce_api/screens/allproducts_page.dart';
import 'package:ecommerce_api/screens/categories_page.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'homepage';
  final List<ContainerModel> containerModel = [
    ContainerModel(
        image: 'assets/images/allproducts.png',
        color: const Color.fromARGB(255, 255, 125, 168),
        imageHeight: 200),
    ContainerModel(
        image: 'assets/images/specificcategory.png',
        color: const Color.fromARGB(255, 217, 134, 231),
        imageHeight: 200)
  ];
  List<String> categorynames = ['All products', 'All categories'];
  List<Widget> widgets = [const AllproductsPage(), CaregoryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Welcome to Trendy Store"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: containerModel.length,
            itemBuilder: (context, index) {
              return CustomContainer(
                widget: widgets[index],
                categoryName: categorynames[index],
                containerModel: containerModel[index],
              );
            }));
  }
}
