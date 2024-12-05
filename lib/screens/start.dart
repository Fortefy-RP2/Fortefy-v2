import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../utils/utils.dart';

class StartScreen extends StatefulWidget{
  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index); // Chama a função utilitária de navegação
  }
  
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o serviço desejado...',
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
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

            // Botões na parte inferior
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
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
        onTap: _onItemTapped,
      ),
    );
  }
}
