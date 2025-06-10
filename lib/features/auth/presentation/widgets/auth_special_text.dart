import 'package:flutter/material.dart';
import 'package:test/core/theme/app_pallete.dart';

class AuthSpecialText extends StatelessWidget {
  const AuthSpecialText({
    super.key,
    required this.title1,
    required this.title2,
    this.color,
  });

  final String title1;
  final String title2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title1,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 5), // ← This adds spacing
        Text(
          title2,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: color ?? AppPallete.gradient2,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
