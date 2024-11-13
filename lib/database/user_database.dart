import '../models/user_model.dart';

// Simulando um "banco de dados" de usuários
class UserDatabase {
  static List<UserModel> users = [
    UserModel(email: "admin", password: "admin"),
    UserModel(email: "user1@teste.com", password: "senha123"),
    UserModel(email: "user2@teste.com", password: "senha456"),
  ];

  // Verifica se o usuário existe no banco de dados
  static bool validateUser(String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return true; // Usuário válido
      }
    }
    return false; // Usuário inválido
  }
}
