import 'package:postgres/postgres.dart';

class DatabaseService {
  late final Connection _connection;

  Future<void> connect() async{
    try {
      print('Prestes a conectar:');
      _connection = await Connection.open(
        Endpoint(
          host: 'localhost',
          port: 5432,
          database: 'joao',
          username: 'joao',
          password: '130974',
        ),
        settings: ConnectionSettings(
            sslMode: SslMode.disable,
            connectTimeout: const Duration(seconds: 10)),
      );
      print('conectou');
    } catch (e){
      print('erro $e');
    }

  }

  Future<void> disconnect() async {
    try {
      await _connection.close();
      print('Conexão com o bando de dados encerrada.');
    } catch (e) {
      print('Erro ao encerrar conexão: $e');
    }
  }

  Future<void> insertAluno(Map<String, String> userData) async{
    try{
      await connect();
      print('conectou');

      await _connection.execute(
        Sql.named(
          'INSERT INTO fortefyschema.usuario(cpf, nome, sobrenome, data_nasc, email, senha) VALUES (@cpf, @nome, @sobrenome, @data_nasc, @email, @senha)',
        ),
        parameters: {
          'cpf': userData['cpf'],
          'nome': userData['nome'],
          'sobrenome': userData['sobrenome'],
          'data_nasc': userData['data_nasc'],
          'email': userData['email'],
          'senha': userData['senha'],
        },
      );

    }catch(e){
      print('Erro ao inserir usuario: $e');
    }finally{
      await _connection.close();
    }
  }

  Future<Map<String, dynamic>?> login(String email, String senha) async {
  try {
    await connect();

    // Consulta no banco de dados para verificar as credenciais
    final result = await _connection.execute(
      '''
      SELECT cpf, nome, data_nasc, email
      FROM usuario
      WHERE email = @email AND senha = @senha
      ''',
      parameters: {
        'email': email,
        'senha': senha, // A senha deve estar criptografada
      },
    );
  } catch (e) {
    print('Erro ao realizar login: $e');
    rethrow; // Propaga o erro para que possa ser tratado
  } finally {
    await disconnect();
  }
}

}