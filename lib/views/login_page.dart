import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import '../widgets/email_input.dart'; // Importe o widget de e-mail
import '../widgets/password_input.dart';
import 'home_page.dart'; // Importe o widget de senha

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 114,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/logo_claro.png',
                                  height: 80,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  'Canal PAP',
                                  style: TextStyle(
                                    color: Color(0xFFA6ADB5),
                                    fontSize: 22,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Campo de Email
                      EmailInput(
                        controller: _loginController.emailController,
                        errorMessage: _errorMessage != null &&
                                _errorMessage!.contains("Email")
                            ? _errorMessage
                            : null,
                      ),
                      const SizedBox(height: 16),

// Campo de Senha com ícone de olho
                      PasswordInput(
                        controller: _loginController.passwordController,
                        errorMessage: _errorMessage != null &&
                                _errorMessage!.contains("Senha")
                            ? _errorMessage
                            : null,
                      ),

                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Recuperar senha',
                              style: TextStyle(
                                color: Color(0xFF242B33),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              String? error = _loginController.login();
                              if (error == null) {
                                // Se o login for bem-sucedido, navega para a HomePage
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              } else {
                                if (error.contains("Email")) {
                                  _errorMessage = "Email incorreto";
                                } else if (error.contains("Senha")) {
                                  _errorMessage = "Senha incorreta";
                                } else {
                                  _errorMessage =
                                      error; // Outros tipos de erros
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(_errorMessage!)),
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFFFFC722),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Problemas com a conta? ',
                                  style: TextStyle(
                                    color: Color(0xFFA6ADB5),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Suporte',
                                  style: const TextStyle(
                                    color: Color(0xFF232A33),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }
}
