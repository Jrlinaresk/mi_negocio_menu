import 'package:flutter/material.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:minegociomenu/domain/models/categoria/sub_categoria.dart';
import 'package:uuid/uuid.dart';

class Producto with ChangeNotifier {
  int? productoID; // Cambiado el nombre a camelCase
  final String nombre;
  String? modelo;
  String? marca;
  final Categoria? categoria;
  List<SubCategoria>? types;
  String? imageurl;
  String? videoUrl;
  final double? precio;
  bool? favorito;

  String? origen;
  List<String>? ingredientes;
  String? descripcion;
  String? nota;
  String? tamanno;
  double? peso;
  bool? ecoAmigable;
  String?
      fechaVencimiento; // Cambiado a String para ser compatible con Date en el frontend
  bool? disponibilidad;
  String?
      estado; // Cambiado a String para ser compatible con estado en el frontend
  final String?
      createdAt; // Cambiado a String para ser compatible con Date en el frontend
  final String?
      updatedAt; // Cambiado a String para ser compatible con Date en el frontend

  double? calificacionPromedio;
  List<String>? resennas;

  String? lastprice;
  String? formasDePago;
  List<String>? moneda;
  bool? mayorista;
  double? preciomayorista;
  double? descuento;
  String? tipoDescuento;
  bool? mensajeria;
  bool? garantia;

  Producto({
    this.productoID,
    required this.nombre,
    this.modelo,
    this.marca,
    this.categoria,
    this.types,
    this.imageurl,
    this.videoUrl,
    this.precio,
    this.favorito,
    this.origen,
    this.ingredientes,
    this.descripcion,
    this.nota,
    this.tamanno,
    this.peso,
    this.ecoAmigable,
    this.fechaVencimiento,
    this.disponibilidad,
    this.estado,
    this.createdAt,
    this.updatedAt,
    this.garantia,
    this.calificacionPromedio,
    this.resennas,
    this.lastprice,
    this.formasDePago,
    this.moneda,
    this.mayorista,
    this.preciomayorista,
    this.descuento,
    this.tipoDescuento,
    this.mensajeria,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      productoID: json['ProductoID'],
      nombre: json['nombre'] ?? 'Desconocido',
      modelo: json['modelo'] ?? 'Desconocido',
      marca: json['marca'] ?? 'Desconocido',
      categoria: Categoria.fromJson(json['categoria']),
      types: json['types'] != null
          ? List<SubCategoria>.from(
              json['types'].map((x) => SubCategoria.fromJson(x)),
            )
          : null,
      imageurl: json['imageurl'] ?? 'Desconocido',
      videoUrl: json['videoUrl'] ?? 'Desconocido',
      precio: json['precio'] ?? 'Desconocido',
      favorito: json['favorito'] ?? 'Desconocido',
      origen: json['origen'] ?? 'Desconocido',
      ingredientes: json['ingredientes'] != null
          ? List<String>.from(json['ingredientes'].map((x) => x))
          : null,
      descripcion: json['descripcion'] ?? 'Desconocido',
      nota: json['nota'] ?? 'Desconocido',
      tamanno: json['tamanno'] ?? 'Desconocido',
      peso: json['peso'] ?? 'Desconocido',
      ecoAmigable: json['ecoAmigable'] ?? 'Desconocido',
      fechaVencimiento: json['fechaVencimiento'] ?? 'Desconocido',
      disponibilidad: json['disponibilidad'] ?? 'Desconocido',
      estado: json['estado'] ?? 'Desconocido',
      createdAt: json['createdAt'] ?? 'Desconocido',
      updatedAt: json['updatedAt'] ?? 'Desconocido',
      garantia: json['garantia'] ?? 'Desconocido',
      calificacionPromedio: json['calificacionPromedio'] ?? 'Desconocido',
      resennas: json['resennas'] != null
          ? List<String>.from(json['resennas'].map((x) => x))
          : null,
      lastprice: json['lastprice'] ?? 'Desconocido',
      formasDePago: json['formasDePago'] ?? 'Desconocido',
      moneda: json['moneda'] != null
          ? List<String>.from(json['moneda'].map((x) => x))
          : null,
      mayorista: json['mayorista'] ?? 'Desconocido',
      preciomayorista: json['preciomayorista'] ?? 'Desconocido',
      descuento: json['descuento'] ?? 'Desconocido',
      tipoDescuento: json['tipoDescuento'] ?? 'Desconocido',
      mensajeria: json['mensajeria'] ?? 'Desconocido',
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();

    final lowercaseNombre = nombre.toLowerCase();
    final lowercaseModelo = modelo?.toLowerCase() ?? '';
    final lowercaseMarca = marca?.toLowerCase() ?? '';
    final lowercaseCategoria = categoria?.nombre.toLowerCase() ?? '';

    return lowercaseNombre.contains(lowercaseSearch) ||
        lowercaseModelo.contains(lowercaseSearch) ||
        lowercaseMarca.contains(lowercaseSearch) ||
        lowercaseCategoria.contains(lowercaseSearch);
  }
}
