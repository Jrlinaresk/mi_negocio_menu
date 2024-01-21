import 'package:flutter/foundation.dart';
import 'package:minegociomenu/models/municipio.dart';

class Provincia with ChangeNotifier {
  Provincia({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.municipios,
  });

  final int id;
  final String image;
  final String name;
  final String description;
  final List<Municipio> municipios;
}
