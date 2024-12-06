import 'package:postgres/postgres.dart';
import '../models/usuario.dart';
import 'dart:developer';

class DatabaseService {
  late Connection _connection;

  Future<void> conectar() async{
    try {
      log('Prestes a conectar:');
      _connection = await Connection.open(
        Endpoint(
          host: 'localhost',
          port: 5432,
          database: 'fortefydb',
          username: 'fortefy_app',
          password: 'fortefy_senha',
        ),
        settings: ConnectionSettings(
            sslMode: SslMode.disable,
            connectTimeout: const Duration(seconds: 10)),
      );
      log('conectou');
    } catch (e){
      log('erro $e');
    }

  }

  Future<void> desconectar() async {
    await _connection.close();
  }


  Future<bool> formularioCadastro(Usuario userData) async{

    log('Estrutura montada, vai tentar inserir $userData');
    try{

      if(!await insertUsuario(userData)){
        return false;
      }

      if(userData.cref != null){
        if(!await insertPersonal(userData)){
          return false;
        }
      }

    }catch(e){
      log('Erro ao inserir usuario: $e');
      return false;
    }
    return true;
  }

  Future<bool> insertUsuario(Usuario userData) async{
    try{
      await conectar();

      await _connection.execute(
        Sql.named(
          'INSERT INTO fortefyschema."usuario"(cpf, nome, sobrenome, data_nasc, email, senha) VALUES (@cpf, @nome, @sobrenome, @data_nasc, @email, @senha)',
        ),
        parameters: {
          'cpf': userData.cpf,
          'nome': userData.nome,
          'sobrenome': userData.sobrenome,
          'data_nasc': userData.dataNasc,
          'email': userData.email,
          'senha': userData.senha,
        },
      );

    }catch(e){
      log('Erro ao inserir usuario: $e');
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

      await conectar();

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
      log('Erro ao logar usuario: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

  Future<bool> insertPersonal(Usuario personalData) async{
    try{
      await conectar();

      await _connection.execute(
        Sql.named(
          'INSERT INTO fortefyschema."educador_fisico"(cpf_educador, cref) VALUES (@cpf, @cref);',
        ),
        parameters: {
          'cpf': personalData.cpf,
          'cref': personalData.cref,
        },

      );

    }catch(e){
      log('Erro ao inserir personal: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

}