import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/globals/03bienvenido/presentation/new_home.dart';
import 'package:minegociomenu/core/utils/formaulas.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/login_screen.dart';

class AdministracionScreen extends StatelessWidget {
  const AdministracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = calculateImageWidth(context) / 2;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: Center(
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                body: LoginScreen(),)
            ],
          ),
        ),
      ),
    );
  }
}