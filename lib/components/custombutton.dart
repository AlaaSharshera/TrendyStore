import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {required this.buttonColor,
      required this.textColor,
      required this.buttontext,
      required this.ontap,
      this.image,
      super.key});
  final Color? buttonColor;
  final Color? textColor;
  final String? buttontext;
  final VoidCallback? ontap;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 374,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.white)),
            ),
            backgroundColor: WidgetStatePropertyAll(buttonColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: image,
            ),
            Text(
              buttontext!,
              style: TextStyle(fontSize: 20, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
