import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/globals/03bienvenido/presentation/new_home.dart';
import 'package:minegociomenu/core/utils/formaulas.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = calculateImageWidth(context) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Center(
          child: Stack(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}