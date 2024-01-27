import 'package:flutter/widgets.dart';

class Categoria with ChangeNotifier {
  final int id;
  final String nombre;
  final String? descripcion;
  final String? icono;
  final String? costoxkilometro;
  final int NegocioID;

  Categoria({
    required this.id,
    required this.nombre,
    this.descripcion,
    this.icono,
    this.costoxkilometro,
    required this.NegocioID,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['CategoriaID'] ?? 0,
      nombre: json['Nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      icono: json['icono'] ?? '',
      NegocioID: json['NegocioID'] ?? 0,
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
