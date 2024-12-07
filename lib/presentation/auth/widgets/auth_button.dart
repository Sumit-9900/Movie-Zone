import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget title;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: title,
    );
  }
}
