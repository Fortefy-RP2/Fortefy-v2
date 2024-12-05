import '../models/usuario.dart';

class MockUser {
  Usuario getCurrentUser() {
    return Usuario(
      nome: 'Joselito',
      sobrenome: 'da Silva',
      dataNasc: '21/06/1999',
      email: 'joselits@gmail.com', 
      senha: '123456',
      cpf: '06160081632'
    );
  }
}