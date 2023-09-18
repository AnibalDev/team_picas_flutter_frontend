import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final String subfixText;
  final bool isObscured;

  const TextFieldCustom({
    super.key,
    required this.text,
    this.subfixText = "",
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: isObscured,
        decoration: InputDecoration(
          label: Text(text),
          suffix: TextButton(
            child: Text(subfixText),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
