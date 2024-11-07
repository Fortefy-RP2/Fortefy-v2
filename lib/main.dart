import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:projetos/screens/cadastro.dart';
import 'package:projetos/screens/configuracoes.dart';
import 'package:projetos/screens/login.dart';
=======
>>>>>>> cddcf3a (Tela de cadastro)
import 'screens/aluno.dart';
import 'screens/personal.dart';
import 'screens/start.dart';
//import 'screens/configuracoes_screen.dart';
//import 'screens/chats_screen.dart';

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
<<<<<<< HEAD
      home: AlunoScreen(),
      routes: {
        '/start': (context) => StartWidget(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/login' : (context) => LoginScreen(),
        '/configuracoes' : (context) => ConfiguracoesWidget()
=======
      home: StartScreen(),
      routes: {
        '/start': (context) => StartScreen(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
>>>>>>> cddcf3a (Tela de cadastro)
      },
    );
  }
}

