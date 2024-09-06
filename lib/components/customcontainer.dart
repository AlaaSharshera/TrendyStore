import 'package:ecommerce_api/models/container_model.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {required this.containerModel,
      required this.categoryName,
      required this.widget,
      super.key});
  final ContainerModel containerModel;
  final String categoryName;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 225,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: containerModel.color,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  categoryName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 110,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return widget;
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "view All",
                        style: TextStyle(
                          color: containerModel.color,
                          fontSize: 15,
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Image(
                image: AssetImage(
                  containerModel.image,
                ),
                height: containerModel.imageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
