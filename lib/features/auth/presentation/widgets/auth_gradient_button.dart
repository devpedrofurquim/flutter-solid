import 'package:flutter/material.dart';
import 'package:test/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight),
        borderRadius: BorderRadius.circular(15)
      ),
      child: ElevatedButton(onPressed: () {  }, 
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(395, 55),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),),
      ),
    );
  }
}