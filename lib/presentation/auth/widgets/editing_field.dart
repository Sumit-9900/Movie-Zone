import 'package:flutter/material.dart';

class EditingField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType? keyboardType;
  const EditingField({
    super.key,
    required this.controller,
    required this.title,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
