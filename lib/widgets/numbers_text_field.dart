import 'package:flutter/material.dart';

class NumbersTextField extends StatefulWidget {
  const NumbersTextField({
  required this.numberController,
    required this.hint,
    super.key,
  });

  final TextEditingController numberController;
  final String hint;

  @override
  State<NumbersTextField> createState() => _NumbersTextFieldState();
}

class _NumbersTextFieldState extends State<NumbersTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.numberController,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 12,
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
    );
  }
}
