import 'package:flutter/material.dart';

Widget autocompleteTextField({
  required String labelText,
  required TextEditingController controller,
  required List<String> options, // Lista de sugestões
  bool obscureText = false,
}) {
  return Autocomplete<String>(
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      }
      // Filtrar sugestões com base no texto digitado
      return options.where((option) => 
          option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
    },
    onSelected: (String selection) {
      controller.text = selection; // Atualizar o texto no controlador
    },
    fieldViewBuilder: (BuildContext context, TextEditingController fieldController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
      fieldController.text = controller.text; // Sincronizar com o controlador externo
      return TextFormField(
        controller: fieldController,
        focusNode: focusNode,
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
    },
  );
}
