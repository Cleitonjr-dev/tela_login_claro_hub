import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? errorMessage;

  const PasswordInput({
    Key? key,
    required this.controller,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
      children: [
        Container(
          height: 51,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: widget.errorMessage != null
                    ? Colors.red
                    : Colors.transparent, // Borda vermelha se houver erro
              ),
            ),
          ),
          child: Center(
            child: TextField(
              cursorColor: const Color(0xFFD52B1E),
              controller: widget.controller,
              obscureText: !_isPasswordVisible, // Oculta/mostra senha
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: 'Senha',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        if (widget.errorMessage != null &&
            widget.errorMessage!.contains("Senha"))
          Padding(
            padding: const EdgeInsets.only(
                top: 4), // Espaço entre o campo e a mensagem de erro
            child: Text(
              widget.errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
