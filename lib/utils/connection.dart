import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> checkLocationPermission(BuildContext context) async {
  // Verifica si se tienen permisos de ubicación
  var status = await Permission.location.status;

  if (status.isGranted) {
    // Si ya se tienen permisos, redirige a la pantalla de inicio
    Navigator.pushReplacementNamed(context, '/inicio');
  } else {
    // Si no se tienen permisos, solicita los permisos al usuario
    status = await Permission.location.request();

    if (status.isGranted) {
      // Si el usuario concede los permisos, redirige a la pantalla de inicio
      Navigator.pushReplacementNamed(context, '/inicio');
    } else {
      // Si el usuario no concede los permisos, puedes manejarlo de acuerdo a tu lógica
      // Puedes mostrar un mensaje, por ejemplo.
      // También podrías darle al usuario la opción de ajustar manualmente los permisos desde la configuración de la aplicación.
      print('El usuario no concedió permisos de ubicación.');
    }
  }
}
