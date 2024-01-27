// Función para guardar el carrito en un archivo
import 'dart:convert';
import 'dart:io';

import 'package:minegociomenu/domain/models/payment/orden/orden_whatsapp.dart';

void guardarCarrito(List<OrdenWhatsApp> carrito) {
  final carritoFile = File('carrito.json');
  carritoFile.writeAsStringSync(
      jsonEncode(carrito.map((orden) => orden.toJson()).toList()));
}

List<OrdenWhatsApp> obtenerCarritoActual() {
  try {
    // Intentar abrir el archivo 'carrito.json'
    final File carritoFile = File('carrito.json');

    if (!carritoFile.existsSync()) {
      // Si el archivo no existe, devolver una lista vacía
      return [];
    }

    // Leer el contenido del archivo y convertirlo en una lista de órdenes
    final String carritoJson = carritoFile.readAsStringSync();
    final List<dynamic> ordenesJson = jsonDecode(carritoJson);
    final List<OrdenWhatsApp> carrito = ordenesJson
        .map((ordenJson) => OrdenWhatsApp.fromJson(ordenJson))
        .toList();

    return carrito;
  } catch (e) {
    // Manejar errores (por ejemplo, si hay problemas de formato en el archivo)
    print('Error al obtener el carrito: $e');
    return [];
  }
}
