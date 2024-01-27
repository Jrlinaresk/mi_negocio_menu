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
      'producto': producto,
    };
  }
}
