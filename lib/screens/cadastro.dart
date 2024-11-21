import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:projetos/screens/aluno.dart';
import 'package:projetos/screens/personal.dart';
<<<<<<< HEAD
=======
import '../screens/screens.dart';
>>>>>>> 0c648a8 (Arquivo de screens.dart)
import '../widgets/widgets.dart';

class CadastroScreen extends StatelessWidget {
  final GlobalKey<FormState> cadastroKey = GlobalKey<FormState>();

  final String aluno = 'Aluno';
  final String personal = 'Personal';
  CadastroScreen({super.key});
=======

class Cadastro extends StatelessWidget {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  Cadastro({super.key});
>>>>>>> cddcf3a (Tela de cadastro)

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
                        
<<<<<<< HEAD
                        ButtonPadrao(texto: aluno, destino: AlunoScreen()),
=======
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AlunoScreen()),
                            );
                          },
                          child: Text(
                            'Aluno',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
>>>>>>> cddcf3a (Tela de cadastro)
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
                        
<<<<<<< HEAD
                        ButtonPadrao(texto: personal, destino: PersonalScreen())
=======
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PersonalScreen()),
                            );
                          },
                          child: Text(
                            'Personal',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
>>>>>>> cddcf3a (Tela de cadastro)
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