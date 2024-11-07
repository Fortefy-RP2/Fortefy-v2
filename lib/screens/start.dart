import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fortefy - Início'),
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
                hintText: 'Digite o serviço desejado...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
    );
  }
}
