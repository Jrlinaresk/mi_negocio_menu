/* import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

String phoneNumber = 'No disponible';

Future<String> obtenerNumeroTelefono(BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  try {
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneNumber = androidInfo.device ?? 'No disponible';
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Agrega código aquí para iOS si es necesario.
      // En iOS, el acceso al número de teléfono está más restringido.
    }
  } catch (e) {
    print('Error al obtener el número de teléfono: $e');
  }
  return phoneNumber;
}
 */