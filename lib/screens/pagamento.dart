import 'package:flutter/material.dart';
import 'package:projetos/utils/cardGenericoSemButton.dart';
import '../utils/utils.dart';
import '../screens/screens.dart';

class ConfirmarAgendamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirmar agendamento",
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
              // Informações do Personal
              Text(
                "Seu personal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              PersonalCardGenerico(
                nome: 'Renato Cariani', 
                especialidade: 'Musculação, emagrecimento.', 
                cidade: 'SP, São Caetano do Sul', 
                avaliacao: 5.0, 
                numeroAvaliacoes: 456, 
                preco: 1500.00, 
              ),
              SizedBox(height: 20),

              // Informações de Agendamento
              Text(
                "Agendamento",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              _buildInfoRow("Data........................", "12/12/2024", context),
              _buildInfoRow("Qtd de horas................", "2 horas", context),
              _buildInfoRow("Subtotal..........................................", "R\$1.000,00", null),
              SizedBox(height: 20),

              // Informações de Pagamento
              Text(
                "Pagamento",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              _buildInfoRow("Total", "R\$1.000,00", null),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor:  Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text("Pagar"),
                ),
              ),
              SizedBox(height: 20),

              // Informações adicionais
              Text(
                "Lembrando que será cobrado uma taxa de 10% do valor apenas para o primeiro treino. As demais aulas não serão cobradas!",
                style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, BuildContext? context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Text(value, style: TextStyle(fontSize: 16)),
              if (context != null)
                SizedBox(width: 10),
              if (context != null)
                ElevatedButton(
                  onPressed: () {
                    // Lógica para alterar a informação
                  },
                  style: ElevatedButton.styleFrom(foregroundColor:  Colors.blue),
                  child: Text("Alterar"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
