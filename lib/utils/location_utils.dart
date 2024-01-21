// location_utils.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

Future<void> requestLocationPermission() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationException('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print(position);
    // Aquí podrías devolver la posición o manejarla de alguna manera
  } catch (e) {
    // Aquí maneja el error, lánzalo nuevamente o haz lo que sea necesario
    throw LocationException(e.toString());
  }
}

class LocationException implements Exception {
  final String message;
  LocationException(this.message);

  @override
  String toString() {
    return 'LocationException: $message';
  }
}
