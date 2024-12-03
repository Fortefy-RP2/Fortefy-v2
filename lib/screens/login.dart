import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../database/database.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final String login = 'Entrar';
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

  void onLoginButtonPressed() async {
  if (loginKey.currentState!.validate()) {
    final dbService = DatabaseService();

    try {
      // Obtém os valores dos campos
      String email = emailController.text.trim();
      String senha = senhaController.text.trim();

      // Chama a função de login
      final usuario = await dbService.login(email, senha);

      if (usuario != null) {
        // Login bem-sucedido
        print('Bem-vindo, ${usuario['nome']}!');
        // Redirecionar para outra tela, ex.: página inicial
        Navigator.pushReplacementNamed(context, '/paginaInicial', arguments: usuario);
      } else {
        // Exibe uma mensagem de erro
        print('Credenciais inválidas.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email ou senha incorretos!')),
        );
      }
    } catch (e) {
      print('Erro ao realizar login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao tentar logar, tente novamente!')),
      );
    }
  }
}
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
                      buildTextField('Email:', controller: emailController),
                      SizedBox(height: 20),

                      buildTextField('Senha:', controller: senhaController),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                ElevatedButton(onPressed: onLoginButtonPressed, child: Text('Entrar')),
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