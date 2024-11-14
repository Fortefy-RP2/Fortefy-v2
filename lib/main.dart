import 'package:flutter/material.dart';
import 'package:projetos/screens/cadastro.dart';
import 'package:projetos/screens/chatHome.dart';
import 'package:projetos/screens/configuracoes.dart';
import 'package:projetos/screens/login.dart';
import 'screens/aluno.dart';
import 'screens/personal.dart';
import 'screens/start.dart';
//import 'screens/configuracoes_screen.dart';
//import 'screens/chatHome.dart';

void main() {
  runApp(FortefyApp());
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class FortefyApp extends StatelessWidget {
  const FortefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Fortefy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: '/',
      home: StartScreen(),
      routes: {
        '/start': (context) => StartScreen(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/login' : (context) => LoginScreen(),
        '/chats' : (context) => ChatHomeScreen(),
        '/configuracoes' : (context) => ConfiguracoesWidget()
      },
    );
  }
}

