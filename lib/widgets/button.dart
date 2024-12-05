import 'package:flutter/material.dart';

class ButtonPadrao extends StatelessWidget {
  final String texto;
  final Widget destino;

  const ButtonPadrao({super.key, required this.texto, required this.destino});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destino),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blueAccent, width: 2)
          ),
        ),
        child: Text(texto)
      ); 
    }
  }