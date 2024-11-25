import 'package:flutter/material.dart';
import 'package:projetos/widgets/textField.dart';

class telaDeBusca extends StatelessWidget {
  const telaDeBusca ({super.key});

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
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Text('Selecione a região onde deseja um personal:'),
              buildTextField('Região: '),
              SizedBox(height: 20),

              Text('Selecione o destino buscado:'),
              buildTextField('Tipo de serviço:'),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}