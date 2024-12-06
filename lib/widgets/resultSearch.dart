import 'package:flutter/material.dart';
import 'package:projetos/screens/login.dart';
import 'package:projetos/utils/personalCard.dart';

class resultSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(), 
          icon: Icon(Icons.arrow_back, color: Colors.white)
        ),
      ),
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Center(
        child: ListView(
          children: [
            PersonalCard(nome: "Nome exemplo", especialidade: "Exemplo", cidade: "Guarulhos", avaliacao: 4.5, numeroAvaliacoes: 300, preco: 300, onAgendar: LoginScreen.new)
          ],
        )
      ),
    );
  }
}