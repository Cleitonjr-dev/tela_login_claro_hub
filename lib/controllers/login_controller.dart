import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../database/user_database.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Função de login agora faz validações separadas de email e senha
  String? login() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return "Todos os campos são obrigatórios";
    }

    // Verificar se o email existe
    UserModel? user = UserDatabase.users.firstWhere(
        (user) => user.email == email,
        orElse: () => UserModel(email: "", password: ""));

    if (user.email.isEmpty) {
      return "Email incorreto";
    }

    // Verificar se a senha está correta
    if (user.password != password) {
      return "Senha incorreta";
    }

    return null; // Login bem-sucedido
  }

  // Liberação dos controladores quando não mais necessários
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
