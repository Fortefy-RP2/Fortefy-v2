import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/configuracoes');
      break;
    case 1:
      Navigator.pushNamed(context, '/start');
      break;
    case 2:
      Navigator.pushNamed(context, '/chat');
      break;
  }
}