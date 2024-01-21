import 'dart:math';
import 'package:flutter/material.dart';
import 'package:minegociomenu/domain/models/categoria/categoria.dart';
import 'package:uuid/uuid.dart';

class RandomCategoryGenerator {
  static Categoria getRandomCategoria() {
    final uuid = const Uuid().v4();
    final idAsInt = int.parse(uuid.substring(0, 8), radix: 16);
    final id = idAsInt;
    final name = getRandomNameCategoria();
    const image = Icons.account_circle_outlined;
    const description = 'Descripción aleatoria del producto';
    const costoxkilometro = 0.60;

    return Categoria(
      id: id,
      nombre: name,
      icono: image,
      descripcion: description,
      costoxkilometro: costoxkilometro,
    );
  }

  static List<Categoria> gerCategoriaList() {
    late List<Categoria> result = [];
    late int a = 0;
    while (a++ < 10) {
      result.add(getRandomCategoria());
    }
    return result;
  }

  final List<String> categories = [
/*     'Electrónica',
    'Ropa',
    'Alimentos',
    'Hogar',
    'Juguetes',
    'Salud y Belleza',
    'Automotriz',
    'Deportes',
    'Electrodomésticos',
    'Libros', */
    'Alimentos',
    'Autos',
    'Belleza',
    'Construcción',
    'Decoración',
    'Electrónica',
    'Envases',
    'Juguetes',
    'Muebles',
    'Ropa',
    'Tecnología',
  ];

  final Set<String> usedCategories = <String>{};
  final Random random = Random();

  String getRandomCategory() {
    if (usedCategories.length == categories.length) {
      // Se han utilizado todas las categorías, así que se reinicia el conjunto.
      usedCategories.clear();
    }

    String category;

    do {
      final randomIndex = random.nextInt(categories.length);
      category = categories[randomIndex];
    } while (usedCategories.contains(category));

    usedCategories.add(category);
    return category;
  }

  static final randomCategoryGenerator = RandomCategoryGenerator();

  static String getRandomNameCategoria() {
    return randomCategoryGenerator.getRandomCategory();
  }

//
}
