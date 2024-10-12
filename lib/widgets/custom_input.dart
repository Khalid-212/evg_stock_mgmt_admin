import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final double cardWidth;
  final double cardHeight;
  final IconData icon;

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.icon,
    this.obscureText = false, // Set default value here
    this.cardWidth = 30, // Set a default width if not provided
    this.cardHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50),
      ),
      width: cardWidth, // Use the cardWidth provided or the default
      height: cardHeight,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.grey), // Display the icon
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
