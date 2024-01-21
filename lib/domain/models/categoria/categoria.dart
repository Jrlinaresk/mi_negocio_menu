import 'package:flutter/widgets.dart';

class Categoria with ChangeNotifier {
  final int id;
  final String nombre;
  final String? descripcion;
  final IconData icono;
  final double? costoxkilometro;

  Categoria({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.icono,
    this.costoxkilometro,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
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
