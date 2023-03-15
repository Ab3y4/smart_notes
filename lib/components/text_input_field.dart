import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      this.keyboardType,
      this.hintText,
      this.icon,
      required this.onChange,
      required this.obscr});
  final TextInputType? keyboardType;
  final String? hintText;
  final IconData? icon;
  final bool obscr;
  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 97, 37, 200),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 97, 37, 200),
            ),
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: const Color.fromARGB(255, 97, 37, 200),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          labelText: hintText,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 97, 37, 200),
          ),
        ),
        obscureText: obscr,
        onChanged: onChange,
      ),
    );
  }
}
