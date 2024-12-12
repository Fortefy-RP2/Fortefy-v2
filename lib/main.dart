import 'package:flutter/material.dart';
import 'package:projetos/utils/utils.dart';
import 'package:projetos/models/usuario.dart';
import 'package:projetos/widgets/busca.dart';
import 'package:projetos/widgets/widgets.dart';
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
      home: CadastroScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/login' : (context) => LoginScreen(),
        '/configuracoes' : (context) => ConfiguracoesWidget(),
        '/chat' : (context) => ChatWidget(),
        '/busca' : (context) => telaDeBusca(),
        '/start' : (context) => StartScreen()
      },
    );
  }
}

