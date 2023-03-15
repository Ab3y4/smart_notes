import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton(
      {Key? key, required this.onPressed, required this.drawerText});

  final VoidCallback onPressed;
  final String drawerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 97, 37, 200),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Center(
            child: Text(
              drawerText,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
      width: double.infinity,
    );
  }
}
