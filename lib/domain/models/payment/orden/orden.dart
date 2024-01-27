import 'package:flutter/widgets.dart';

class Orden with ChangeNotifier {
  final int OrdenID;
  final String nombre;
  final String? descripcion;
  final String? icono;
  final String? costoxkilometro;
  final int NegocioID;

  Orden({
    required this.OrdenID,
    required this.nombre,
    this.descripcion,
    this.icono,
    this.costoxkilometro,
    required this.NegocioID,
  });

  factory Orden.fromJson(Map<String, dynamic> json) {
    return Orden(
      OrdenID: json['OrdenID'] ?? 0,
      nombre: json['Nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      icono: json['icono'] ?? '',
      NegocioID: json['NegocioID'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OrdenID': OrdenID,
      'nombre': nombre,
      'descripcion': descripcion,
      'icono': icono,
    };
  }
}
