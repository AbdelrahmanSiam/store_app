import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.textInputType,
      required this.text,
      this.onChanged,
      this.isObsureText = false});
  final String text;
  TextInputType? textInputType;
  ValueChanged<String>? onChanged;
  bool? isObsureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: isObsureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
            fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
