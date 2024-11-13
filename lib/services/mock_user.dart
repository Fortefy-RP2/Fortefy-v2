import '../models/user.dart';

class MockUser {
  User getCurrentUser() {
    return User(
      name: 'Joselito da Silva', 
      birthDate: '21/06/1999', 
      email: 'joselits@gmail.com', 
      password: '123456',
    );
  }
}