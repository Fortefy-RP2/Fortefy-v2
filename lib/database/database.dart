import 'package:postgres/postgres.dart';
import 'package:projetos/models/usuario.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chatTypes;

class DatabaseService {
  late Connection _connection;

  Future<void> conectar() async{
    try {
      print('Prestes a conectar:');
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
      print('conectou');
    } catch (e){
      print('erro $e');
    }

  }

  Future<void> desconectar() async {
    await _connection.close();
  }


  Future<bool> formularioCadastro(Usuario userData) async{

    print('Estrutura montada, vai tentar inserir $userData');
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
      print('Erro ao inserir usuario: $e');
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
      print('Erro ao inserir usuario: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

  Future<Usuario?> login(Map<String, String> userData) async{
    Usuario usuario;
    try{
      if (userData['email'] == null || userData['senha'] == null) {
        return null;
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
        return null;
      }

      Map rowMap = result.first.toColumnMap();
      DateTime data = rowMap['data_nasc'] as DateTime;
      String dataStr = '${data.day}/${data.month}/${data.year}';
      usuario = Usuario(
        cpf: rowMap['cpf'],
        nome: rowMap['nome'],
        sobrenome: rowMap['sobrenome'],
        dataNasc: dataStr,
        email: rowMap['email'],
        senha: rowMap['senha']
      );

    }catch(e){
      print('Erro ao logar usuario: $e');
      return null;
    }finally{
      await _connection.close();
    }
    return usuario;
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
      print('Erro ao inserir personal: $e');
      return false;
    }finally{
      await _connection.close();
    }
    return true;
  }

  Future<List<chatTypes.Message>> getMessagesFromChat(String? cpfUsuario, String? cpfInterlocutor) async {
    List<chatTypes.Message> messages = <chatTypes.Message>[];
    
    try {
      if (cpfUsuario == null || cpfInterlocutor == null) {
        return messages;
      }

      await conectar();

      var query = await _connection.execute(
        Sql.named(
          'select * from fortefyschema."mensagem" where '
          '(cpf_remetente = @usuario and cpf_destinatario = @interlocutor) or '
          '(cpf_remetente = @interlocutor and cpf_destinatario = @usuario) '
          'order by data desc;'
        ),
        parameters: {
          'usuario': cpfUsuario,
          'interlocutor': cpfInterlocutor,
        },
      );

      for (ResultRow row in query) {
        Map rowMap = row.toColumnMap();

        chatTypes.Message message = chatTypes.TextMessage(
          id: rowMap['id'].toString(),
          author: chatTypes.User(
            id: rowMap['cpf_remetente']
          ),
          text: rowMap['texto_mensagem'],
          createdAt: DateTime.now().millisecondsSinceEpoch,          
        );

        messages.add(message);
      }

    } catch(e) {
      print('Erro ao buscar mensagens: $e');
    } finally {
      await _connection.close();
    }

    return messages;
  }

  Future<Map<String, String>> getInterlocutores(String? cpfUsuario) async {
    Map<String, String> interlocutores = {};
    
    try {
      if (cpfUsuario == null) {
        return interlocutores;
      }

      await conectar();

      var query = await _connection.execute(
        Sql.named(
          'select cpf, nome, sobrenome from fortefyschema."usuario" where cpf in ( '
	        'select cpf_remetente from fortefyschema."mensagem" where cpf_destinatario = @usuario '
	        'UNION '
	        'select cpf_destinatario from fortefyschema."mensagem" where cpf_remetente = @usuario);'
        ),
        parameters: {
          'usuario': cpfUsuario,
        },
      );

      for (ResultRow row in query) {
        Map rowMap = row.toColumnMap();
        interlocutores[rowMap['cpf']] = '${rowMap['nome']} ${rowMap['sobrenome']}';
      }

    } catch(e) {
      print('Erro ao buscar mensagens: $e');
    } finally {
      await _connection.close();
    }

    return interlocutores;
  }
}