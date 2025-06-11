import 'package:flutter/material.dart';

class AuthSpecialText extends StatelessWidget {
  const AuthSpecialText({
    super.key,
    required this.title1,
    required this.title2,
    required this.color,
    required this.onTap,
  });

  final String title1;
  final String title2;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title2,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
