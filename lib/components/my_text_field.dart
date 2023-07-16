import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsucreText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsucreText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsucreText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            fillColor: Color.fromARGB(255, 251, 247, 251),
            filled: true,
           hintText: hintText,
           hintStyle: const TextStyle(color: Colors.purple) 
      ),
    );
  }
}
