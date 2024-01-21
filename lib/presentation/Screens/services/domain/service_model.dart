import 'package:flutter/foundation.dart';

class Service with ChangeNotifier {
  final String? serviceId;
  final String? name;
  final String? image;
  final String? description;
  final List<String>? type;
  // final List<String?> getMilk;
  // final List<String?> extras;
  final String? price;
  final String? unit_of_measure;
  final String? quantity;
  final String? telefono;
  final double starRate;
  final String? provincia;
  final bool favorito;

  Service({
    this.serviceId,
    this.name,
    this.image,
    this.description,
    this.type,
    // this.getMilk,
    // this.extras,
    this.price,
    this.unit_of_measure,
    this.quantity,
    this.telefono,
    this.provincia,
    this.starRate = 3,
    //para control interno de la apk
    this.favorito = false,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['serviceId'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      type: List<String>.from(json['type']),
      price: json['price'],
      unit_of_measure: json['unit_of_measure'],
      quantity: json['quantity'],
      telefono: json['telefono'],
      provincia: json['provincia'],
      starRate: json['starRate'] ?? 3,
      favorito: json['favorito'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'name': name,
      'image': image,
      'description': description,
      'type': type,
      'price': price,
      'unit_of_measure': unit_of_measure,
      'quantity': quantity,
      'telefono': telefono,
      'provincia': provincia,
      'starRate': starRate,
      'favorito': favorito,
    };
  }

  Service copyWith({
    String? serviceId,
    String? name,
    String? image,
    String? description,
    List<String>? type,
    String? price,
    String? unit_of_measure,
    String? quantity,
    String? telefono,
    double? starRate,
    String? provincia,
    bool? favorito,
  }) {
    return Service(
      serviceId: serviceId ?? this.serviceId,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      price: price ?? this.price,
      unit_of_measure: unit_of_measure ?? this.unit_of_measure,
      quantity: quantity ?? this.quantity,
      telefono: telefono ?? this.telefono,
      starRate: starRate ?? this.starRate,
      provincia: provincia ?? this.provincia,
      favorito: favorito ?? this.favorito,
    );
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
