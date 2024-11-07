import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../utils/utils.dart';
//import '../widgets/widgets.dart';
//import 'dart:io';
//import '../services/services.dart';

class StartWidget extends StatefulWidget{
  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartWidget> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index); // Chama a função utilitária de navegação
  }
=======

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
>>>>>>> cddcf3a (Tela de cadastro)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
=======
      appBar: AppBar(
        title: Text('Fortefy - Início'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
>>>>>>> cddcf3a (Tela de cadastro)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o serviço desejado...',
<<<<<<< HEAD
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
=======
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
>>>>>>> cddcf3a (Tela de cadastro)
                ),
              ),
            ),
            SizedBox(height: 20),

            // Título de treinos cadastrados
            Text(
              'Seus treinos cadastrados',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Display de treinos (Simulação de uma lista de treinos)
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Número de treinos cadastrados (pode ser variável)
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Treino ${index + 1}'),
                      subtitle: Text('Detalhes do treino ${index + 1}'),
                      trailing: Icon(Icons.fitness_center),
                    ),
                  );
                },
              ),
            ),

            // Espaço entre os itens e os botões
            SizedBox(height: 20),
<<<<<<< HEAD
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Configurações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Colors.white),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 23, 93, 95),
        onTap: _onItemTapped, // Usa a função de navegação utilitária
      ),
=======

            // Botões na parte inferior
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botão Configurações
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/configuracoes');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.settings, size: 30),
                      Text('Configurações'),
                    ],
                  ),
                ),

                // Botão Tela Inicial (atual)
                ElevatedButton(
                  onPressed: () {
                    // Mantenha-se na tela atual ou recarregue o conteúdo
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home, size: 30),
                      Text('Início'),
                    ],
                  ),
                ),

                // Botão Chats com Profissionais
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chats');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.chat, size: 30),
                      Text('Chats'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
>>>>>>> cddcf3a (Tela de cadastro)
    );
  }
}
