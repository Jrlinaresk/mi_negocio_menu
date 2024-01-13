import 'package:flutter/material.dart';

class CustomUnderlinedText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomUnderlinedText({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
