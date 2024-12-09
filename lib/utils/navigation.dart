import 'package:flutter/material.dart';
import 'package:projetos/models/usuario.dart';

void navigateToPage(BuildContext context, int index, Usuario usuario) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/configuracoes', arguments: usuario);
      break;
    case 1:
      Navigator.pushNamed(context, '/start', arguments: usuario);
      break;
    case 2:
      Navigator.pushNamed(context, '/chat', arguments: usuario);
      break;
  }
}