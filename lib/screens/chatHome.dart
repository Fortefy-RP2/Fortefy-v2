import 'package:flutter/material.dart';
import 'package:projetos/database/database.dart';
import '../services/services.dart';
import '../utils/utils.dart';
import 'package:projetos/models/usuario.dart';

import 'package:projetos/screens/chat.dart';


class ChatWidget extends StatefulWidget{
  @override
  _ChatHomeScreen createState() => _ChatHomeScreen();
}

class _ChatHomeScreen extends State<ChatWidget> {
  
  late Usuario usuario;
  Map<String, String> interlocutores = {};
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _loadInterlocutores());
  }

  void _loadInterlocutores() async {
    final interlocutores = await DatabaseService().getInterlocutores(usuario.cpf);
    setState(() {
      this.interlocutores = interlocutores;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index, usuario); // Chama a função utilitária de navegação
  }

  void _onChatTapped(int index) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      settings: RouteSettings(
        arguments: ChatArguments (
          usuario: this.usuario,
          cpfInterlocutor: interlocutores.keys.elementAt(index),
          nomeInterlocutor: interlocutores.values.elementAt(index)
        )
      ),
      builder: (BuildContext context) => ChatPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    usuario = ModalRoute.of(context)?.settings.arguments as Usuario;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de treinos cadastrados
            Text(
              'Suas conversas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            
            // // Campo de busca
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Pesquise conversa...',
            //     hintStyle: TextStyle(color: Colors.white),
            //     labelStyle: TextStyle(color: Colors.white),
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),

            // Display de treinos (Simulação de uma lista de treinos)
            Expanded(
              child: ListView.builder(
                itemCount: interlocutores.length, // Número de treinos cadastrados (pode ser variável)
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(interlocutores.values.elementAt(index)),
                      trailing: Icon(Icons.chat_bubble),
                      onTap: () {_onChatTapped(index);},
                    ),
                  );
                },
              ),
            ),

            // Espaço entre os itens e os botões
            SizedBox(height: 20),
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
    );
  }
}
