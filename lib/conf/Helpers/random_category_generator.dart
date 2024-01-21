import 'dart:math';
import 'package:minegociomenu/models/categoria_model.dart';
import 'package:uuid/uuid.dart';

class RandomCategoryGenerator {
  static Categoria getRandomCategoria() {
    final id = const Uuid().v4();
    final name = getRandomNameCategoria();
    const image = 'assets/categoria.png';
    const description = 'Descripción aleatoria del producto';
    const costoxkilometro = '0.60usd';

    return Categoria(
      id: id,
      name: name,
      image: image,
      description: description,
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
