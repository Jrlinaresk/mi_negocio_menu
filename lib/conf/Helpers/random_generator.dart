import 'dart:math';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:uuid/uuid.dart';

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.spain);
    return randomNames.fullName();
  }

  static Stream<String> randomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) => getRandomName())
        .take(10);
  }

  static GeTimageRandom(String nombr) {
    if (nombr == 'Alimentos') {
      var imagenesAlimentos = [
        'assets/icons/alimentos/alimentos-01.png',
        'assets/icons/alimentos/alimentos-02.png',
        'assets/icons/alimentos/alimentos-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Autos') {
      var imagenesAlimentos = [
        'assets/icons/autos/autos-01.png',
        'assets/icons/autos/autos-02.png',
        'assets/icons/autos/autos-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Belleza') {
      var imagenesAlimentos = [
        'assets/icons/belleza/belleza-01.png',
        'assets/icons/belleza/belleza-02.png',
        'assets/icons/belleza/belleza-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Construccion') {
      var imagenesAlimentos = [
        'assets/icons/construccion/construccion-01.png',
        'assets/icons/construccion/construccion-02.png',
        'assets/icons/construccion/construccion-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Decoracion') {
      var imagenesAlimentos = [
        'assets/icons/decoracion/decoracion-01.png',
        'assets/icons/decoracion/decoracion-02.png',
        'assets/icons/decoracion/decoracion-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Electrónica') {
      var imagenesAlimentos = [
        'assets/icons/electro/electro-01.png',
        'assets/icons/electro/electro-02.png',
        'assets/icons/electro/electro-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Envases') {
      var imagenesAlimentos = [
        'assets/icons/envases/envases-01.png',
        'assets/icons/envases/envases-02.png',
        'assets/icons/envases/envases-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Juguetes') {
      var imagenesAlimentos = [
        'assets/icons/juguetes/juguetes-01.png',
        'assets/icons/juguetes/juguetes-02.png',
        'assets/icons/juguetes/juguetes-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Muebles') {
      var imagenesAlimentos = [
        'assets/icons/muebles/muebles-01.png',
        'assets/icons/muebles/muebles-02.png',
        'assets/icons/muebles/muebles-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Ropa') {
      var imagenesAlimentos = [
        'assets/icons/ropa/ropa-01.png',
        'assets/icons/ropa/ropa-02.png',
        'assets/icons/ropa/ropa-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
    if (nombr == 'Tecnologia') {
      var imagenesAlimentos = [
        'assets/icons/tecnologia/tecnologia-01.png',
        'assets/icons/tecnologia/tecnologia-02.png',
        'assets/icons/tecnologia/tecnologia-03.png',
      ];
      return RandomImage(imagenesAlimentos);
    }
  }

  static RandomImage(List<String> imagenes) {
    final random = Random();
    final index = random.nextInt(imagenes.length);
    return imagenes[index];
  }

  static String getFormattedDateTime() {
    final now = DateTime.now().toUtc();
    final formattedDateTime = now.toIso8601String();
    return formattedDateTime;
  }
}
