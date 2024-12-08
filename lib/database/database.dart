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
          database: 'fortefydb',
          username: 'andre',
          password: 'andre',
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
    await _connection.close();
  }

  Future<void> insertAluno(Map<String, String> userData) async{
    try{
      await connect();
      print('conectou');

      await _connection!.execute(
        Sql.named(
          'INSERT INTO fortefyschema."usuario"(cpf, nome, sobrenome, data_nasc, email, senha) VALUES (@cpf, @nome, @sobrenome, @data_nasc, @email, @senha)',
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


}