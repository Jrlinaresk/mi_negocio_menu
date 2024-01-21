import 'package:flutter/material.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:minegociomenu/domain/models/categoria/sub_categoria.dart';
import 'package:uuid/uuid.dart';

class Producto with ChangeNotifier {
  int? id = int.parse(const Uuid().v4().substring(0, 8), radix: 16);
  //principales
  final String nombre;
  String? modelo;
  String? marca; //
  final Categoria? categoria; //
  List<SubCategoria>? types;
  String? imageurl;
  String? videoUrl; //
  final double? precio;
  bool? favorito;

  //detalles
  String? origen; // nacionao o internacional
  List<String>? ingredientes; //
  String? descripcion;
  String? nota;
  String? tamanno; //pequenno grande mediano
  double? peso; //
  bool? ecoAmigable; //
  DateTime? fechaVencimiento; //
  bool? disponibilidad = true;
  String? stado = "Listo para venta"; // accesible no disponible ...
  final DateTime? createdAt; //
  final DateTime? updatedAt; //

  //review
  double? calificacionPromedio;
  List<String>? resennas; //

  //payment
  String? lastprice;
  String? formasDePago; // efectivo o transferencia o ambos
  List<String>? moneda; //
  bool? mayorista;
  double? preciomayorista; //
  double? descuento;
  String? tipoDescuento; // Porcentaje, cantidad fija, etc.
  bool? mensajeria; //
  bool? garantia = false;

  Producto({
    this.id,
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
    this.stado,
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
      id: json['id'],
      nombre: json['nombre'] ?? 'Desconocido',
      modelo: json['modelo'] ?? 'Desconocido',
      marca: json['marca'] ?? 'Desconocido',
      categoria: json['categoria'] ?? 'Desconocido',
      types: json['types'] ?? 'Desconocido',
      imageurl: json['imageurl'] ?? 'Desconocido',
      videoUrl: json['videoUrl'] ?? 'Desconocido',
      precio: json['precio'] ?? 'Desconocido',
      favorito: json['favorito'] ?? 'Desconocido',
      origen: json['origen'] ?? 'Desconocido',
      ingredientes: json['ingredientes'] ?? 'Desconocido',
      descripcion: json['descripcion'] ?? 'Desconocido',
      nota: json['nota'] ?? 'Desconocido',
      tamanno: json['tamanno'] ?? 'Desconocido',
      peso: json['peso'] ?? 'Desconocido',
      ecoAmigable: json['ecoAmigable'] ?? 'Desconocido',
      fechaVencimiento: json['fechaVencimiento'] ?? 'Desconocido',
      disponibilidad: json['disponibilidad'] ?? 'Desconocido',
      stado: json['stado'] ?? 'Desconocido',
      createdAt: json['createdAt'] ?? 'Desconocido',
      updatedAt: json['updatedAt'] ?? 'Desconocido',
      garantia: json['garantia'] ?? 'Desconocido',
      calificacionPromedio: json['calificacionPromedio'] ?? 'Desconocido',
      resennas: json['resennas'] ?? 'Desconocido',
      lastprice: json['lastprice'] ?? 'Desconocido',
      formasDePago: json['formasDePago'] ?? 'Desconocido',
      moneda: json['moneda'] ?? 'Desconocido',
      mayorista: json['mayorista'] ?? 'Desconocido',
      preciomayorista: json['preciomayorista'] ?? 'Desconocido',
      descuento: json['descuento'] ?? 'Desconocido',
      tipoDescuento: json['tipoDescuento'] ?? 'Desconocido',
      mensajeria: json['mensajeria'] ?? 'Desconocido',
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();

    final lowercaseNombre = nombre?.toLowerCase() ?? '';
    final lowercaseModelo = modelo?.toLowerCase() ?? '';
    final lowercaseMarca = marca?.toLowerCase() ?? '';
    final lowercaseCategoria = categoria?.nombre.toLowerCase() ?? '';

    return lowercaseNombre.contains(lowercaseSearch) ||
        lowercaseModelo.contains(lowercaseSearch) ||
        lowercaseMarca.contains(lowercaseSearch) ||
        lowercaseCategoria.contains(lowercaseSearch);
  }
}
