import 'package:flutter/material.dart';
import 'package:projetos/screens/resultadoBusca.dart';
import '../screens/screens.dart';
import 'package:projetos/widgets/widgets.dart';
import 'package:projetos/utils/utils.dart';

class telaDeBusca extends StatelessWidget {

  final regionControler = TextEditingController();
  final serviceControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 23, 93, 95),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.65,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Text('Região onde deseja um personal:'),
              autocompleteTextField(
                labelText: 'Região:', 
                controller: regionControler, 
                options: ['São Paulo', 'São Caetano do Sul', 'Taboão da Serra', 'Guarulhos', 'Campo Limpo', 'Embu das Artes', 'São José do Rio Preto', 'Ribeirão Preto']),
              SizedBox(height: 20),

              Text('Serviço buscado:'),
              autocompleteTextField(
                labelText: 'Serviço desejado:', 
                controller: serviceControler, 
                options: ['Musculação', 'Emagrecimento', 'Fisioterapia', 'Tonificação', 'Fortalecimento', 'Corrida', 'Luta', 'Futebol']),
              SizedBox(height: 20),

              GenderSelection(),
              PriceSlider(),
              SizedBox(height: 15),

              ButtonPadrao(texto: 'Buscar', destino: Resultadobusca())
            ],
          ),
        ),
      ),
    );
  }
}