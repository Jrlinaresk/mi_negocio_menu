import 'package:flutter/material.dart';
import 'package:minegociomenu/domain/models/base_entity.dart';

class Negocio with BaseEntity, ChangeNotifier {
  int? NegocioID; // Cambiado el nombre a camelCase
  final String nombre;
  final List<String> ImagenUrl;
  List<String>? VideoUrl;
  final String LogoUrl;
  String? FaceboockLink;
  final String WhatsAppLink;
  String? InstagramLink;
  final String Provincia;
  //
  String? direccion;
  String? email;
  String? categoria;
  //
  String? Slogan;
  final String DiasLaborables;
  final String HorarioLaborable;
//agregar luego estos
  String? descripcion;
  final String
      estado; // Cambiado a String para ser compatible con estado en el frontend
  final DateTime?
      createdAt; // Cambiado a String para ser compatible con Date en el frontend
  final DateTime?
      updatedAt; // Cambiado a String para ser compatible con Date en el frontend
  double? calificacionPromedio;
  List<String>? resennas;
  bool? mayorista;
  bool? mensajeria;

  Negocio(
      {this.NegocioID,
      required this.nombre,
      required this.ImagenUrl,
      this.VideoUrl,
      required this.LogoUrl,
      this.FaceboockLink,
      required this.WhatsAppLink,
      this.InstagramLink,
      required this.Provincia,
      this.direccion,
      this.email,
      this.categoria,
      this.Slogan,
      required this.DiasLaborables,
      required this.HorarioLaborable,
      this.descripcion,
      required this.estado,
      this.createdAt,
      this.updatedAt,
      this.calificacionPromedio,
      this.resennas,
      this.mayorista,
      this.mensajeria});

  factory Negocio.fromJson(Map<String, dynamic> json) {
    return Negocio(
      NegocioID: json['NegocioID'],
      nombre: json['Nombre'] ?? "Desconocido",
      ImagenUrl: [
        json['ImagenUrl'] ?? ["Desconocido"]
      ],
      VideoUrl: [
        json['VideoUrl'] ?? "Desconocido"
      ], // Aquí envuelve el valor en una lista
      LogoUrl: json['LogoUrl'] ?? "Desconocido",
      FaceboockLink: json['FaceboockLink'] ?? "Desconocido",
      WhatsAppLink: json['WhatsAppLink'] ?? "Desconocido",
      InstagramLink: json['InstagramLink'] ?? "Desconocido",
      Provincia: json['Provincia'] ?? "Desconocida",
      direccion: json['direccion'] ?? "Desconocida",
      email: json['email'] ?? "Desconocido",
      categoria: json['categoria'] ?? "Desconocida",
      Slogan: json['Slogan'] ?? "Desconocido",
      DiasLaborables: json['DiasLaborables'] ?? "Desconocido",
      HorarioLaborable: json['HorarioLaborable'] ?? "Desconocido",
      descripcion: json['descripcion'] ?? 'Sin más detalles ',
      estado: json['estado'] ?? "Desconocido",
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      calificacionPromedio: json['calificacionPromedio'] ?? 4.5,
      resennas: json.containsKey('resennas')
          ? json['resennas'] ?? ["resennas"]
          : [], // Manejo de la ausencia del campo
      mayorista: json['mayorista'] ?? false,
      mensajeria: json['mensajeria'] ?? false,
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();

    final lowercaseNombre = nombre.toLowerCase();
    final lowercaseModelo = Provincia?.toLowerCase() ?? '';

    return lowercaseNombre.contains(lowercaseSearch) ||
        lowercaseModelo.contains(lowercaseSearch);
  }
//revisar luego

/*   factory Negocio.fromJson(Map<String, dynamic> json) {
    return Negocio(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        direccion: json['direccion'],
        telefono: json['telefono'],
        email: json['email'],
        img1: json['img1'],
        img2: json['img2'],
        categoria: json['categoria']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'img1': img1,
      'img2': img2,
      'categoria': categoria
    };
  }

  Negocio copyWith(
      {String? id,
      String? nombre,
      String? descripcion,
      String? direccion,
      String? telefono,
      String? email,
      String? img1,
      String? img2,
      bool? favorito,
      String? categoria}) {
    return Negocio(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      img1: img1 ?? this.img1,
      img2: img2 ?? this.img2,
      favorito: favorito ?? this.favorito,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
 */
}
