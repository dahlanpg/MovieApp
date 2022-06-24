// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscure;

  const CustomTextField(
      {Key? key,
      required this.onChanged,
      required this.label,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white)),
      ),
      obscureText: obscure,
      onChanged: onChanged,
    );
  }
}
