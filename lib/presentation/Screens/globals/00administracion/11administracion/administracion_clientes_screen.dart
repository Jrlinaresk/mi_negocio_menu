import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/globals/03bienvenido/presentation/new_home.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/login_screen.dart';
import 'package:minegociomenu/presentation/widgets/botones/item_administracion.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_fullscreen_image.dart';
import 'package:minegociomenu/presentation/widgets/imagenes/build_image.dart';

import '../../../../../core/utils/formaulas.dart';
import '../../../../../domain/data/local/config.dart';

class AdministracionClientesScreen extends StatelessWidget {
  const AdministracionClientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ancho = calculateImageWidth(context) / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Center(  
          child: MyGridWidget(),
        ),
      ),
    );
  }
}

class MyGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    items_config_admin_panel.length;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // Número de columnas en el grid
        crossAxisSpacing: 32.0, // Espaciado entre las columnas
        mainAxisSpacing: 0.1, // Espaciado entre las filas
      ),
      itemCount: items_config_admin_panel.length, // Número total de elementos en el grid
      itemBuilder: (context, index) {
        // Construir el widget individual en cada celda del grid
        return Edit_Admin_Button(buttonText: items_config_admin_panel[index].buttonText, route: items_config_admin_panel[index].route, Image: items_config_admin_panel[index].Image,);
      },
    );
  }
}
