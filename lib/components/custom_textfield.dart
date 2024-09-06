import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hinttext,
    this.onchange,
    this.textInputType,
    super.key,
  });
  final String? hinttext;

  final Function(String)? onchange;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextField(
        onChanged: onchange,
        keyboardType: textInputType,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 208, 206, 206), width: 2),
          ),
          hintText: hinttext!,
          suffixIcon: null,
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }
}
