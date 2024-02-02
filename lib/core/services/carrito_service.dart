import 'dart:convert';
import 'package:minegociomenu/domain/models/payment/orden/orden_whatsapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarritoService {
  static const _carritoKey = 'carrito_key';

  static Future<void> guardarOrden(OrdenWhatsApp orden) async {
    final prefs = await SharedPreferences.getInstance();
    final carrito = await obtenerCarrito();
    carrito.add(orden.toMap()
        as OrdenWhatsApp); //orden.toMap() // Usar toMap() en lugar de jsonEncode
    prefs.setString(
        _carritoKey, jsonEncode(carrito)); // No necesitas map y jsonEncode aquí
/*     prefs.setStringList(
        _carritoKey, carrito.map((item) => jsonEncode(item)).toList()); */
  }

  static Future<List<OrdenWhatsApp>> obtenerCarrito() async {
    final prefs = await SharedPreferences.getInstance();
    final carritoJson = prefs.getString(_carritoKey) ?? '';
    if (carritoJson != '') {
      final List<dynamic> carritoData = jsonDecode(carritoJson);
      return carritoData.map((item) => OrdenWhatsApp.fromMap(item)).toList();
    }
    return [];
  }
}
