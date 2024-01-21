import 'package:flutter/foundation.dart';

class Categoria with ChangeNotifier {
  Categoria({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.costoxkilometro,
  });

  final String id;
  final String image;
  final String name;
  final String description;
    final String costoxkilometro;
}
