import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../widgets/widgets.dart';
=======
>>>>>>> cddcf3a (Tela de cadastro)

class PersonalScreen extends StatelessWidget {
  final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
=======
      backgroundColor: Colors.black87,
>>>>>>> cddcf3a (Tela de cadastro)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo e nome do app
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.amber, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'FORTEFY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),

                // Formulário de Cadastro de Personal
                Form(
                  key: personalKey,
                  child: Column(
                    children: [
                      // Campo Nome Completo
<<<<<<< HEAD
                      buildTextField('Nome completo:'),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      buildTextField('Data de nascimento:'),
                      SizedBox(height: 15),

                      // Campo Email
                      buildTextField('Email:'),
                      SizedBox(height: 15),

                      // Campo Senha
                      buildTextField('Senha:', obscureText: true),
                      SizedBox(height: 15),

                      // Campo Repetir Senha
                      buildTextField('Repita sua senha:', obscureText: true),
                      SizedBox(height: 15),

                      // Campo CREF
                      buildTextField('CREF:'),
=======
                      _buildTextField('Nome completo:'),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      _buildTextField('Data de nascimento:'),
                      SizedBox(height: 15),

                      // Campo Email
                      _buildTextField('Email:'),
                      SizedBox(height: 15),

                      // Campo Senha
                      _buildTextField('Senha:', obscureText: true),
                      SizedBox(height: 15),

                      // Campo Repetir Senha
                      _buildTextField('Repita sua senha:', obscureText: true),
                      SizedBox(height: 15),

                      // Campo CREF
                      _buildTextField('CREF:'),
>>>>>>> cddcf3a (Tela de cadastro)
                      SizedBox(height: 30),

                      // Botão Cadastrar
                      ElevatedButton(
                        onPressed: () {
                          if (personalKey.currentState!.validate()) {
                            // Processar cadastro
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                        ),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
  // Função para construir os campos de texto
  
=======

  // Função para construir os campos de texto
  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return TextFormField(
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
}
>>>>>>> cddcf3a (Tela de cadastro)
