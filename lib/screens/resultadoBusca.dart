import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../screens/screens.dart';

class Resultadobusca extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultado da busca',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmarAgendamento(), 
                    ),
                  );
                },
                child: PersonalCardGenerico(
                  nome: 'Renato Cariani', 
                  especialidade: 'Musculação, emagrecimento.', 
                  cidade: 'SP, São Caetano', 
                  avaliacao: 4.9, 
                  numeroAvaliacoes: 717, 
                  preco: 500.00
                ),
              ),

              SizedBox(height: 10),

              PersonalCardGenerico(
              nome: 'Rodrigo Góes', 
              especialidade: 'Tonificação, fortalecimento.', 
              cidade: 'SP, São Paulo', 
              avaliacao: 4.8, 
              numeroAvaliacoes: 455, 
              preco: 350.00
              )
            ],
          ),
        ),
      ),
    );
  }
}