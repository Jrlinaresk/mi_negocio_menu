import 'package:flutter/widgets.dart';

class SubCategoria with ChangeNotifier {
  final int id;
  final String nombre;
  final String? descripcion;
  final IconData icono;
  double? costoxkilometro = 0;

  SubCategoria({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.icono,
    this.costoxkilometro,
  });

  factory SubCategoria.fromJson(Map<String, dynamic> json) {
    return SubCategoria(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      icono: json['icono'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'icono': icono,
    };
  }
}
