import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
>>>>>>> 0c648a8 (Arquivo de screens.dart)
=======
import 'package:projetos/widgets/busca.dart';
>>>>>>> 85a25d5 (Tela de busca incompleta)
//import 'screens/chats_screen.dart';
import './screens/screens.dart';

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
<<<<<<< HEAD
      home: AlunoScreen(),
=======
      home: telaDeBusca(),
>>>>>>> 85a25d5 (Tela de busca incompleta)
      routes: {
        '/start': (context) => StartWidget(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/login' : (context) => LoginScreen(),
<<<<<<< HEAD
        '/configuracoes' : (context) => ConfiguracoesWidget()
=======
      home: StartScreen(),
      routes: {
        '/start': (context) => StartScreen(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
>>>>>>> cddcf3a (Tela de cadastro)
=======
        '/configuracoes' : (context) => ConfiguracoesWidget(),
        '/busca' : (context) => telaDeBusca()
>>>>>>> 85a25d5 (Tela de busca incompleta)
      },
    );
  }
}

