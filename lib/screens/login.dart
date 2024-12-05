import 'package:flutter/material.dart';
import 'package:projetos/screens/screens.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final String login = 'Entrar';
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

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
                Row(
                  children: [
                  Expanded( 
                    child: 
                      Image.asset(
                        'assets/fortefy_logo.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ]
                ),
                SizedBox(height: 20),

                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      buildTextField('Email:', emailController),
                      SizedBox(height: 20),

                      buildTextField('Senha:', senhaController),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                ButtonPadrao(texto: 'Entrar', destino: StartScreen()),
                SizedBox(height: 70),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: Text(
                    'Não possui cadastro? Clique aqui.',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}