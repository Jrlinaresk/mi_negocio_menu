import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:minegociomenu/domain/models/ubicacion/ubicacion.dart';

final updatedLocationProviderClient = FutureProvider<Ubicacion>((ref) async {
  Ubicacion ufinal;
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final response = await http.get(Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ufinal = Ubicacion.fromJson(data);

      return ufinal;
    } else {
      throw Exception('Error al obtener información de ubicación');
    }
  } catch (e) {
    throw Exception('Error al obtener ubicación: $e');
  }
});

class MyEntityNotifier extends StateNotifier<List<Ubicacion>> {
  MyEntityNotifier() : super([]);

  void addEntity(Ubicacion entity) {
    state = [...state, entity];
  }

  // Puedes agregar otras acciones según tus necesidades
}

final updatedLocationProvider =
    FutureProvider.family<Ubicacion, LatLng>((ref, location) async {
  Ubicacion ufinal;
  final response = await http.get(Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    ufinal = Ubicacion.fromJson(data);

    return ufinal;
  } else {
    throw Exception('Error al obtener información de ubicación');
  }
});
