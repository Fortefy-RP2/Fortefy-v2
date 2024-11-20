import 'package:flutter/material.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      appBar: AppBar(
        title: Text('Fortefy - Conversas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Pesquise conversa...',
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
              'Seus chats',
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
                      title: Text('Pessoa ${index + 1}'),
                      subtitle: Text('Ultima mensagem ${index + 1}'),
                      trailing: Icon(Icons.chat_bubble),
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
              children: [
                // Botão Configurações
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
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
                    Navigator.pushNamed(context, '/start');
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
                    //Navigator.pushNamed(context, '/chats');
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
    );
  }
}
