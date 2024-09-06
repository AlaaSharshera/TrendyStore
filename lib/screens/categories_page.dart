import 'package:ecommerce_api/components/customcontainer.dart';

import 'package:ecommerce_api/models/container_model.dart';
import 'package:ecommerce_api/screens/products_page.dart';
import 'package:ecommerce_api/services/get_all_categories.dart';
import 'package:flutter/material.dart';

class CaregoryPage extends StatelessWidget {
  CaregoryPage({super.key});
  static String id = 'caregorypage';
  final List<ContainerModel> containerModels = [
    ContainerModel(
        image: 'assets/images/women-shopping.png',
        color: const Color(0xffFA8479),
        imageHeight: 150),
    ContainerModel(
        image: 'assets/images/menshopping .png',
        imageHeight: 150,
        color: const Color(0xff22A1DB)),
    ContainerModel(
        image: 'assets/images/electronic.png',
        imageHeight: 150,
        color: const Color(0xffF3CD46)),
    ContainerModel(
        image: 'assets/images/jewellry.png',
        imageHeight: 180,
        color: const Color(0xffDCCAA1))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Trendy Store"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: GetAllCategories().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<String> categories = snapshot.data!;

                return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return CustomContainer(
                          widget: ProductsPage(
                            categoryName: categories[index],
                          ),
                          containerModel: containerModels[index],
                          categoryName: categories[index]);
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
