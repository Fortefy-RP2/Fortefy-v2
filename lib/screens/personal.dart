import 'package:flutter/material.dart';
import 'package:projetos/database/database.dart';
import '../widgets/widgets.dart';

class PersonalScreen extends StatelessWidget {
  final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  PersonalScreen({super.key});

  final TextEditingController crefController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
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
                      // Campo CREF
                      buildTextField('CREF:', controller: crefController),
                      SizedBox(height: 15),

                      // Campo Nome Completo
                      buildTextField('Nome completo:', controller: nomeController),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      buildTextField('Data de nascimento:', controller: dataNascimentoController),
                      SizedBox(height: 15),

                      // Campo Email
                      buildTextField('Email:', controller: emailController),
                      SizedBox(height: 15),

                      // Campo Senha
                      buildTextField('Senha:', obscureText: true, controller: senhaController),
                      SizedBox(height: 30),

                      // Botão Cadastrar
                      ElevatedButton(
                        onPressed: () async {
                          if (personalKey.currentState!.validate()) {
                            final cref = crefController.text;
                            final nome = nomeController.text;
                            final dataNascimentoText = dataNascimentoController.text;
                            final email = emailController.text;
                            final senha = senhaController.text;

                            // Validação adicional para evitar valores nulos ou vazios
                            if (cref.isEmpty || nome.isEmpty || dataNascimentoText.isEmpty || email.isEmpty || senha.isEmpty) {
                              print("Todos os campos devem ser preenchidos.");
                              return;
                            }

                            DateTime? dataNascimento;
                            try {
                              // Tenta converter a data de nascimento para DateTime
                              dataNascimento = DateTime.parse(dataNascimentoText);
                            } catch (e) {
                              print("Formato de data inválido. Use o formato YYYY-MM-DD.");
                              return;
                            }

                            final personalData = {
                              'cref': cref,
                              'nome': nome,
                              'data_nascimento': dataNascimento,
                              'email': email,
                              'senha': senha
                            };

                            // Envia os dados para o banco
                            final dbService = DatabaseService();
                            
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
    );  }
}
