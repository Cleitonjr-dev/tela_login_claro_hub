import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;

  const EmailInput({
    Key? key,
    required this.controller,
    this.errorMessage,
  }) : super(key: key);

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
                color: errorMessage != null
                    ? Colors.red
                    : Colors.transparent, // Bordas vermelhas quando houver erro
              ),
            ),
          ),
          child: Center(
            child: TextField(
              cursorColor: const Color(0xFFD52B1E),
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                hintText: 'Email',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),
        if (errorMessage != null && errorMessage!.contains("Email"))
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 6),
            child: Text(
              errorMessage!,
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

