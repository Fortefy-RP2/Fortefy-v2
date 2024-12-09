import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:projetos/database/database.dart';
import 'package:projetos/models/usuario.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final String login = 'Entrar';
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  Future<Usuario?> _submitLogin() async{
    print('Botão apertado:');

    Usuario? usuario;

    final userData = {
      'email': emailController.text,
      'senha': senhaController.text,
    };

    print('Estrutura montada, vai tentar logar com os dados $userData');
    final DatabaseService dbservico =  await DatabaseService();
    try{
      await dbservico.conectar();
      usuario = await DatabaseService().login(userData);
      if(usuario == null){
        return null;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao logar: $e')),
      );
      return null;
    }finally{
      await dbservico.desconectar();
    }
    return usuario;
  }

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

                      buildTextField('Senha:', senhaController, obscureText: true),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (loginKey.currentState!.validate()) {
                      Usuario? usuario = await _submitLogin();
                      if(usuario != null){
                        Navigator.of(context, rootNavigator: true).pushNamed('/start', arguments: usuario);
                      }
                    }
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blueAccent, width: 2)
                      ),
                    ),
                    child: Text(login)
                ),
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