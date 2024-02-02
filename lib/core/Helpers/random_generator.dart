import 'dart:math';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class RandomGenerator {
  static String getRandomName() {
    final randomNames = RandomNames(Zone.spain);
    return randomNames.fullName();
  }

  static Stream<String> randomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) => getRandomName())
        .take(10);
  }

  static Future<String> GeTimageRandom(String nombr) async {
    String extension = ".jpg";
    String folderPath = "assets/productos/";

    List<String> imageNames = await ImageListLoader.loadImageNames(
        folderPath, nombr.toLowerCase(), extension);

    return "$folderPath${nombr.toLowerCase()}/" +
        RandomImageGenerator(imageNames).getNextRandomImage();
  }

  static String getFormattedDateTime() {
    final now = DateTime.now().toUtc();
    final formattedDateTime = now.toIso8601String();
    return formattedDateTime;
  }
}

class ImageListLoader {
  static Future<List<String>> loadImageNames(
      String folderPath, String nombr, String extension) async {
    // Ruta relativa al directorio de tu proyecto
    String directoryPath = '${folderPath}${nombr}/';

    try {
      // Carga la lista de activos en el directorio
      final List<String> assetList = await rootBundle
          .loadString('AssetManifest.json')
          .then((String jsonString) {
        final Map<String, dynamic> manifestMap = json.decode(jsonString);
        return manifestMap.keys.toList();
      });

      // Filtra y muestra solo los nombres de archivos con extensión .jpg
      final List<String> imageNames = assetList
          .where((asset) =>
              asset.startsWith(directoryPath) && asset.endsWith(extension))
          .map((asset) {
        // Obtiene solo el nombre del archivo desde la ruta completa
        return asset.substring(directoryPath.length);
      }).toList();

      return imageNames;
    } catch (e) {
      print('Error al cargar o procesar la lista de activos: $e');
    }
    return [];
  }
}

class RandomImageGenerator {
  List<String> _remainingImages = [];
  List<String> _originalImages = [];
  Random _random = Random();

  RandomImageGenerator(List<String> images) {
    _originalImages = List<String>.from(images);
    _remainingImages = List<String>.from(_originalImages);
  }

  String getNextRandomImage() {
    if (_remainingImages.isEmpty) {
      _remainingImages = List<String>.from(_originalImages);
    }

    final index = _random.nextInt(_remainingImages.length);
    final randomImage = _remainingImages[index];

    _remainingImages.removeAt(index);

    return randomImage;
  }
}
