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

  Future<bool> insertAluno(Map<String, String> userData) async{
    try{
      await connect();

      await _connection.execute(
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
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

  Future<bool> login(Map<String, String> userData) async{
    try{
      if (userData['email'] == null || userData['senha'] == null) {
        return false;
      }

      await connect();

      final result = await _connection.execute(
        Sql.named(
            'SELECT * FROM fortefyschema."usuario" WHERE senha = @senha AND email = @email'
        ),
        parameters: {
          'email': userData['email'],
          'senha': userData['senha'],
        },
      );

      if(result.isEmpty){
          return false;
      }

    }catch(e){
      print('Erro ao logar usuario: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

  Future<bool> insertPersonal(Map<String, String> personalData) async{
    try{
      await connect();

      await _connection.execute(
        Sql.named(
          'INSERT INTO fortefyschema."usuario"(cpf, nome, sobrenome, data_nasc, email, senha) VALUES (@cpf, @nome, @sobrenome, @data_nasc, @email, @senha);',
        ),
        parameters: {
          'cpf': personalData['cpf'],
          'nome': personalData['nome'],
          'sobrenome': personalData['sobrenome'],
          'data_nasc': personalData['data_nasc'],
          'email': personalData['email'],
          'senha': personalData['senha'],
        },

      );

      await _connection.execute(
        Sql.named(
          'INSERT INTO fortefyschema."educador_fisico"(cpf_educador, cref) VALUES (@cpf, @cref);',
        ),
        parameters: {
          'cpf': personalData['cpf'],
          'cref': personalData['cref'],
        },

      );

    }catch(e){
      print('Erro ao inserir usuario: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

}