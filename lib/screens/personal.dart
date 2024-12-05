import 'package:flutter/material.dart';
import 'package:projetos/screens/screens.dart';
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
                      buildTextField('CREF', crefController),
                      SizedBox(height: 15),

                      // Campo Nome Completo
                      buildTextField('Nome completo:', nomeController),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      buildTextField('Data de nascimento:', dataNascimentoController),
                      SizedBox(height: 15),

                      // Campo Email
                      buildTextField('Email:', emailController),
                      SizedBox(height: 15),

                      // Campo Senha
                      buildTextField('Senha:', obscureText: true, senhaController),
                      SizedBox(height: 30),

                      ButtonPadrao(texto: 'Cadastrar', destino: StartScreen()),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed('/aluno');
                        },
                        child: Text(
                          'Você é aluno? Clique aqui.',
                          style: TextStyle(
                            color: Colors.white54,
                            fontStyle: FontStyle.italic,
                          ),
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
