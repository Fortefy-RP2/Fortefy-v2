import 'package:flutter/material.dart';
import 'package:projetos/screens/personal.dart';
import 'package:projetos/screens/screens.dart';
import 'package:projetos/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
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

            // Texto: "Você é..."
            Text(
              'Você é...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 30),

            // Botões de Aluno e Personal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botão Aluno
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/aluno');
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/moca.jpeg', // Imagem do aluno
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      ButtonPadrao(texto: 'Aluno', destino: AlunoScreen())
                    ],
                  ),
                ),
                SizedBox(width: 30),

                // Botão Personal
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/personal');
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/homem.jpeg', // Imagem do personal
                          width: 120,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      ButtonPadrao(texto: 'Personal', destino: PersonalScreen())
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
