import 'package:flutter/material.dart';
import 'package:projetos/screens/aluno.dart';
import 'package:projetos/screens/personal.dart';
import '../widgets/widgets.dart';

class CadastroScreen extends StatelessWidget {
  final GlobalKey<FormState> cadastroKey = GlobalKey<FormState>();

  final String aluno = 'Aluno';
  final String personal = 'Personal';
  CadastroScreen({super.key});

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
                Image.asset('assets/fortefy_logo.png'),
                Text(
                  'Você é...',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      ),
                    ),
                    SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/moca.jpeg',
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        
                        ButtonPadrao(texto: aluno, destino: AlunoScreen()),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/homem.jpeg',
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        
                        ButtonPadrao(texto: personal, destino: PersonalScreen())
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Você já tem cadastro? Clique aqui.',
                    style: TextStyle(
                    color: Colors.white54,
                    fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}