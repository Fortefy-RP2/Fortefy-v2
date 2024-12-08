import 'package:flutter/material.dart';

Widget buildTextField(String labelText, TextEditingController controller, {bool obscureText = false} ) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    style: TextStyle(color: Colors.white),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor, preencha este campo';
      }
      return null;
    },
  );
}