import 'package:flutter/material.dart';

Widget buildTextField(String label,
    {bool obscureText = false, TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor, preencha este campo';
      }
      return null;
    },
  );
}
