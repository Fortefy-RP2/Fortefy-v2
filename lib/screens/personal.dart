import 'package:flutter/material.dart';
import '../widgets/textField.dart';
import 'package:projetos/database/database.dart';
import '../models/usuario.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => PersonalScreenState();
}

class PersonalScreenState extends State<PersonalScreen> {
  final GlobalKey<FormState> personalKey = GlobalKey<FormState>();

  final crefController = TextEditingController();
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
    crefController.dispose();
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

    final personalData  = Usuario(
        nome: nomeController.text,
        sobrenome: sobrenomeController.text,
        dataNasc: nascimentoController.text,
        email: emailController.text,
        senha: senhaController.text,
        cpf: cpfController.text,
        cref: crefController.text,
    );

    print('Estrutura montada, vai tentar inserir $personalData');
    try{

      if(!await DatabaseService().formularioCadastro(personalData)){
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
                      SizedBox(height: 15),

                      // Campo CREF
                      buildTextField('CREF:', crefController),
                      SizedBox(height: 30),

                      // Botão Cadastrar
                      ElevatedButton(
                        onPressed:  () async {
                          if(await _submitForm()){
                            Navigator.of(context, rootNavigator: true).pushNamed('/login');
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
}
  // Função para construir os campos de texto
  
