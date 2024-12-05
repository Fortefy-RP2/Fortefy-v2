import 'package:flutter/material.dart';

import 'configuracoes.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({super.key});

  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartWidget> {
  int _selectedIndex = 0;
  bool isPersonal = true;
  List<Map<String, String>> treinos = []; // Lista para armazenar os treinos

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navegação entre as telas do BottomNavigationBar
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfiguracoesWidget()),
      );
    }
  }

  void _navigateToCadastroTreino(BuildContext context, {Map<String, String>? treino, int? index}) async {
    final treinoEditado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastroTreinoScreen(
          treino: treino,
        ),
      ),
    );

    if (treinoEditado != null) {
      setState(() {
        if (index != null) {
          treinos[index] = treinoEditado; // Atualiza treino existente
        } else {
          treinos.add(treinoEditado); // Adiciona novo treino
        }
      });
    }
  }

  void _removeTreino(int index) {
    setState(() {
      treinos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 93, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o serviço desejado...',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Seus treinos cadastrados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            if (isPersonal)
              Center(
                child: _buildPremiumButton(context),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: treinos.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(treinos[index]),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) => _removeTreino(index),
                    child: Card(
                      child: ListTile(
                        title: Text(treinos[index]['titulo'] ?? ''),
                        subtitle: Text(
                          "Horários: ${treinos[index]['horarios']}\n"
                              "Dias: ${treinos[index]['dias']}\n"
                              "Especialidade: ${treinos[index]['especialidade']}\n"
                              "Localização: ${treinos[index]['localizacao']}",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _navigateToCadastroTreino(
                                context,
                                treino: treinos[index],
                                index: index,
                              ), // Editar treino
                            ),
                            const Icon(Icons.fitness_center, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        backgroundColor: const Color.fromARGB(255, 23, 93, 95),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.amber,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () => _navigateToCadastroTreino(context),
      child: const Text(
        "Criar Treino",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class CadastroTreinoScreen extends StatelessWidget {
  final Map<String, String>? treino; // Recebe treino para edição
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController horariosController = TextEditingController();
  final TextEditingController diasController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();

  CadastroTreinoScreen({super.key, this.treino}) {
    if (treino != null) {
      tituloController.text = treino!['titulo'] ?? '';
      horariosController.text = treino!['horarios'] ?? '';
      diasController.text = treino!['dias'] ?? '';
      especialidadeController.text = treino!['especialidade'] ?? '';
      localizacaoController.text = treino!['localizacao'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar Treino")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: horariosController,
              decoration: const InputDecoration(labelText: "Horários"),
            ),
            TextField(
              controller: diasController,
              decoration: const InputDecoration(labelText: "Dias"),
            ),
            TextField(
              controller: especialidadeController,
              decoration: const InputDecoration(labelText: "Especialidade"),
            ),
            TextField(
              controller: localizacaoController,
              decoration: const InputDecoration(labelText: "Localização"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final novoTreino = {
                  "titulo": tituloController.text,
                  "horarios": horariosController.text,
                  "dias": diasController.text,
                  "especialidade": especialidadeController.text,
                  "localizacao": localizacaoController.text,
                };
                Navigator.pop(context, novoTreino);
              },
              child: const Text("Salvar Treino"),
            ),
          ],
        ),
      ),
    );
  }
}
