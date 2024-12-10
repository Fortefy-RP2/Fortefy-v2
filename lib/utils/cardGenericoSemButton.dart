import 'package:flutter/material.dart';

class PersonalCardGenerico extends StatelessWidget {
  final String nome;
  final String especialidade;
  final String cidade;
  final double avaliacao;
  final int numeroAvaliacoes;
  final double preco;

  // Construtor
  const PersonalCardGenerico({
    Key? key,
    required this.nome,
    required this.especialidade,
    required this.cidade,
    required this.avaliacao,
    required this.numeroAvaliacoes,
    required this.preco,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 182, 176, 176),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Sem a imagem, então vamos apenas mostrar o nome e detalhes à direita
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  especialidade,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  cidade,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(
                      '$avaliacao ($numeroAvaliacoes+)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Text(
                  'R\$${preco.toStringAsFixed(2)} p/hora',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
