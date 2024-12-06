import 'package:flutter/material.dart';
import 'screens/cadastro.dart';
import 'screens/configuracoes.dart';
import 'screens/login.dart';
import 'screens/aluno.dart';
import 'screens/personal.dart';
import 'screens/start.dart';
import 'screens/pagamento.dart';
import 'screens/pagamento.dart';
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
      home: PersonalScreen(),
      routes: {
        '/start': (context) => StartWidget(),
        '/aluno': (context) => AlunoScreen(),
        '/personal': (context) => PersonalScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/login': (context) => LoginScreen(),
        '/configuracoes': (context) => ConfiguracoesWidget(),
        '/pagamento': (context) => PagamentoScreen(),
      },
    );
  }
}
