import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:projetos/main.dart';
import 'package:postgres/postgres.dart';
import 'package:projetos/database/database.dart';


class AlunoScreen extends StatefulWidget{
  const AlunoScreen({super.key});

  @override
  State<AlunoScreen> createState() => formularioCustomizado();
}


class formularioCustomizado extends State<AlunoScreen>{
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

  Future<void> _submitForm() async{
    print('Botão apertado:');

    if(senhaController.text != confirmaSenhaController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas devem ser iguais')),
      );
      return;
    }

      final userData = {
        'nome': nomeController.text,
        'sobrenome': sobrenomeController.text,
        'data_nasc': nascimentoController.text,
        'email': emailController.text,
        'senha': senhaController.text,
        'cpf': cpfController.text,
      };
    print('Estrutura montada, vai tentar inserir $userData');
    final DatabaseService dbservico =  await DatabaseService();
      try{
        await dbservico.connect();
        await DatabaseService().insertAluno(userData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso')),
        );
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar: $e')),
        );
      }finally{
        await dbservico.disconnect();
      }
  }
=======

class AlunoScreen extends StatelessWidget {
  final GlobalKey<FormState> alunoKey = GlobalKey<FormState>();

  AlunoScreen({super.key});
>>>>>>> cddcf3a (Tela de cadastro)

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

                // Formulário de Cadastro
                Form(
                  key: alunoKey,
                  child: Column(
                    children: [
                      // Campo Nome Completo
<<<<<<< HEAD
                      _buildTextField('Nome:', nomeController),
                      SizedBox(height: 15),

                      _buildTextField('Sobrenome:', sobrenomeController),
                      SizedBox(height: 15),

                      _buildTextField('CPF:', cpfController),
                      SizedBox(height: 15),

                      // Campo Data de Nascimento
                      _buildTextField('Data de nascimento:', nascimentoController),
                      SizedBox(height: 15),

                      // Campo Email
                      _buildTextField('Email:', emailController),
                      SizedBox(height: 15),

                      // Campo Senha
                      _buildTextField('Senha:', senhaController, obscureText: true),
                      SizedBox(height: 15),

                      // Campo Repetir Senha
                      _buildTextField('Repita sua senha:', confirmaSenhaController, obscureText: true),
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
>>>>>>> cddcf3a (Tela de cadastro)
                      SizedBox(height: 30),

                      // Botão Cadastrar
                      ElevatedButton(
<<<<<<< HEAD
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 15,
                          ),
=======
                        onPressed: () {
                          // Ação ao clicar no botão Cadastrar
                          if (alunoKey.currentState!.validate()) {
                            // Processar cadastro
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Cor do botão
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
>>>>>>> cddcf3a (Tela de cadastro)
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
<<<<<<< HEAD
                          Navigator.of(context, rootNavigator: true).pushNamed('/personal');
=======
                          Navigator.pushNamed(context, '/personal');
>>>>>>> cddcf3a (Tela de cadastro)
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

  // Função para construir os campos de texto
<<<<<<< HEAD
  Widget _buildTextField(String labelText, TextEditingController controller, {bool obscureText = false} ) {
    return TextFormField(
    controller: controller,
=======
  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return TextFormField(
>>>>>>> cddcf3a (Tela de cadastro)
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
