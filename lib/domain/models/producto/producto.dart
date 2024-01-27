import 'package:flutter/material.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:minegociomenu/domain/models/categoria/sub_categoria.dart';
import 'package:uuid/uuid.dart';

class Producto with ChangeNotifier {
  int? productoID; // Cambiado el nombre a camelCase
  final String nombre;
  String? modelo;
  String? marca;
  final int CategoriaID;
  List<int>? types;
  List<String>? ImagenUrl;
  List<String>? videoUrl;
  final double? precio;
  bool? favorito;

  String? origen;
  List<String>? ingredientes;
  String? descripcion;
  String? nota;
  String? tamanno;
  double? peso;
  bool? ecoAmigable;
  DateTime?
      fechaVencimiento; // Cambiado a String para ser compatible con Date en el frontend
  int disponibilidad;
  String
      estado; // Cambiado a String para ser compatible con estado en el frontend
  final DateTime?
      createdAt; // Cambiado a String para ser compatible con Date en el frontend
  final DateTime?
      updatedAt; // Cambiado a String para ser compatible con Date en el frontend

  double? calificacionPromedio;
  List<String>? resennas;

  double? lastprice;
  List<String>? formasDePago;
  List<String>? moneda;
  bool? mayorista;
  double? preciomayorista;
  double? descuento;
  String? tipoDescuento;
  bool? mensajeria;
  String garantia;

  String? oferta;

  Producto(
      {this.productoID,
      required this.nombre,
      this.modelo,
      this.marca,
      required this.CategoriaID,
      this.types,
      this.ImagenUrl,
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
      required this.disponibilidad,
      required this.estado,
      this.createdAt,
      this.updatedAt,
      required this.garantia,
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
      this.oferta});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      productoID: json['ProductoID'],
      nombre: json['nombre'],
      modelo: json['modelo'] ?? 'Desconocido',
      marca: json['marca'] ?? 'Desconocida',
      CategoriaID: json['CategoriaID'],
      types: json['types'] ?? [-1],
      ImagenUrl: json['ImagenUrl'] ?? [],
      videoUrl: json['videoUrl'] ?? [],
      precio: json['precio'] ?? 0,
      favorito: json['favorito'] ?? false,
      origen: json['origen'] ?? 'Desconocido',
      ingredientes: json['ingredientes'] ?? ['Sin detalles'],
      descripcion: json['descripcion'] ?? 'Sin más detalles ',
      nota: json['nota'] ?? 'Sin más detalles',
      tamanno: json['tamanno'] ?? 'Desconocido',
      peso: json['peso'] ?? 0,
      ecoAmigable: json['ecoAmigable'] ?? false,
      fechaVencimiento: json['fechaVencimiento'] != null
          ? DateTime.parse(json['fechaVencimiento'])
          : null,
      disponibilidad: json[
          'disponibilidad'], //valores diferentes para diferentes estados ejemplo 1 disponible
      estado: json['estado'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      calificacionPromedio: json['calificacionPromedio'] ?? 4.5,
      resennas: json['resennas'] ?? [],
      lastprice: (json['lastprice'] as num?)?.toDouble() ?? -1.0,
      formasDePago: json['formasDePago'] ?? ["Efectivo"],
      moneda: json['moneda'] ?? ["CUP"],
      mayorista: json['mayorista'] ?? false,
      preciomayorista: json['preciomayorista'] ?? -1.0,
      descuento: json['descuento'] ?? -1.0,
      tipoDescuento: json['tipoDescuento'] ?? "Sin descuentos",
      mensajeria: json['mensajeria'] ?? false,
      garantia: json['garantia'] ?? 'Sin Garantias',
      oferta: json['oferta'] ?? 'Sin Ofertas',
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();

    final lowercaseNombre = nombre.toLowerCase();
    final lowercaseModelo = modelo?.toLowerCase() ?? '';
    final lowercaseMarca = marca?.toLowerCase() ?? '';

    return lowercaseNombre.contains(lowercaseSearch) ||
        lowercaseModelo.contains(lowercaseSearch) ||
        lowercaseMarca.contains(lowercaseSearch);
  }
}
