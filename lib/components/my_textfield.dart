import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String assetName;
  final IconData? sicon;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.assetName,
    this.sicon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hintText,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          suffixIcon: Icon(
            sicon,
            color: Colors.blue,
          ),
          prefixIcon: Image.asset(
            assetName,
            height: 10,
            width: 10,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
