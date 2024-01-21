import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/inicio_screen.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Tambien puedes iniciar con:',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(
            //   icon: Icon(EvaIcons.twitter),
            //   iconSize: 48.0,
            //   onPressed: () {
            //     // Lógica de inicio de sesión con Facebook
            //   },
            // ),
            // SizedBox(width: 20), // Espacio entre los iconos

            SocialButton(icon: Icon(Bootstrap.facebook), color: Colors.white),
            SizedBox(
              width: 32,
            ),
            SocialButton(icon: Icon(Bootstrap.google), color: Colors.white),
          ],
        ),
      ],
    );
  }
}
