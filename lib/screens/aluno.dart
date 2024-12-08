import 'package:flutter/material.dart';
import 'package:projetos/main.dart';
import 'package:postgres/postgres.dart';
import 'package:projetos/database/database.dart';
import '../widgets/textField.dart';
import '../models/usuario.dart';


class AlunoScreen extends StatefulWidget{
  const AlunoScreen({super.key});

  @override
  State<AlunoScreen> createState() => AlunoScreenState();
}


class AlunoScreenState extends State<AlunoScreen>{
  final GlobalKey<FormState> alunoKey = GlobalKey<FormState>();

  final cpfController = TextEditingController();
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final nascimentoController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmaSenhaController = TextEditingController();

  @override
  void dispose(){
    cpfController.dispose();
    nomeController.dispose();
    sobrenomeController.dispose();
    nascimentoController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmaSenhaController.dispose();
    super.dispose();
  }

  Future<bool> _submitForm() async{
    print('Botão apertado:');

    if(senhaController.text != confirmaSenhaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas devem ser iguais')),
      );
      return false;
    }

      final userData = Usuario(
        nome: nomeController.text,
        sobrenome: sobrenomeController.text,
        dataNasc: nascimentoController.text,
        email: emailController.text,
        senha: senhaController.text,
        cpf: cpfController.text,
      );

    print('Estrutura montada, vai tentar inserir $userData');

      try{
        if(!await DatabaseService().formularioCadastro(userData)){
          return false;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso')),
        );

      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar: $e')),
        );
        return false;
      }
    return true;
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

                // Formulário de Cadastro
                Form(
                  key: alunoKey,
                  child: Column(
                    children: [
                      // Campo Nome Completo
                      buildTextField('Nome:', nomeController),
                      SizedBox(height: 15),

                      buildTextField('Sobrenome:', sobrenomeController),
                      SizedBox(height: 15),

                      buildTextField('CPF:', cpfController),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      buildTextField('Data de nascimento:', nascimentoController),
                      SizedBox(height: 15),

                      // Campo Email
                      buildTextField('Email:', emailController),
                      SizedBox(height: 15),

                      // Campo Senha
                      buildTextField('Senha:', senhaController, obscureText: true),
                      SizedBox(height: 15),

                      // Campo Repetir Senha
                      buildTextField('Repita sua senha:', confirmaSenhaController, obscureText: true),
                      SizedBox(height: 30),

                      // Botão Cadastrar
                      ElevatedButton(
                        onPressed: () async {
                          if(await _submitForm()){
                            Navigator.of(context, rootNavigator: true).pushNamed('/login');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Link para cadastro de personal
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed('/personal');
                        },
                        child: Text(
                          'Você é personal? Clique aqui.',
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
    );
  }


}
