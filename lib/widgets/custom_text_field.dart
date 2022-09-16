import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hint;

  const CustomTextField({Key key, this.controller, this.hint})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.yellow)),
        child: TextFormField(
          controller: controller,
          maxLines: 2,
          minLines: 1,
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        ));
  }
}
