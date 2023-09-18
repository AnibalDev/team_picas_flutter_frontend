import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.assetPath, required this.text});

  final assetPath;
  final text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FilledButton.tonal(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade200),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset(
                assetPath,
                width: 20,
                height: 20,
              ),
              Text(' $text')
            ],
          )),
    );
  }
}
