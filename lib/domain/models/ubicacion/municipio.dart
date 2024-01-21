import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Municipio with ChangeNotifier {
  int id;
  Municipio({
    this.id = 0,
    required this.image,
    required this.name,
    required this.description,
  });

  final String image;
  final String name;
  final String description;
}
