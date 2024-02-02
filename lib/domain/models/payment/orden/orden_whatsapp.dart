import 'package:flutter/widgets.dart';
import 'package:minegociomenu/domain/models/producto/producto.dart';

class OrdenWhatsApp with ChangeNotifier {
  final int OrdenID;
  final int cantidad;
  final Producto producto;

  OrdenWhatsApp({
    required this.OrdenID,
    required this.cantidad,
    required this.producto,
  });

  factory OrdenWhatsApp.fromJson(Map<String, dynamic> json) {
    return OrdenWhatsApp(
      OrdenID: json['OrdenID'],
      cantidad: json['cantidad'],
      producto: json['producto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrdenID': OrdenID,
      'cantidad': cantidad,
      'producto': producto.toJson(),
    };
  }

  // Método para obtener la orden como un mapa
  Map<String, dynamic> toMap() {
    return {
      'OrdenID': OrdenID,
      'cantidad': cantidad,
      'producto': producto
          .toJson(), // Aquí asumimos que producto tiene el método toJson()
    };
  }

  // Método para crear una instancia de OrdenWhatsApp desde un mapa
  factory OrdenWhatsApp.fromMap(Map<String, dynamic> map) {
    return OrdenWhatsApp(
      OrdenID: map['OrdenID'],
      cantidad: map['cantidad'],
      producto: Producto.fromJson(map['producto']),
    );
  }
}
