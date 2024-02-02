import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:minegociomenu/domain/models/ubicacion/ubicacion.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

final _uuid = Uuid();

final LocationLiteStateNotifierProvider =
    StateNotifierProvider<LocationNotifierLite, List<Ubicacion>>((ref) {
  return LocationNotifierLite([]);
});

final updatedLocationProviderClient = FutureProvider<Ubicacion>((ref) async {
  Ubicacion ufinal;
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final response = await http.get(Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}'));

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
      // Verifica si la respuesta es un mapa
      if (decodedResponse is Map) {
        // Accede a la información de ubicación dentro de la clave "address"
        var addressInfo = decodedResponse['address'];
        //
        var generalInfo = decodedResponse;
        // Construye tu objeto Ubicacion utilizando la información extraída
        ufinal = Ubicacion(
          id: 0,
          longitud: decodedResponse['lon'],
          latitud: decodedResponse['lat'],
          display_name: decodedResponse['display_name'],
          city: addressInfo['city_district'],
          road: addressInfo['road'],
          country: addressInfo['country'],
          county: addressInfo['county'],
          suburb: addressInfo['suburb'],
          postcode: addressInfo['postcode'],
          favorito: false,
          types: [decodedResponse['addresstype']],
        );

        int a = 0;
      } else {
        // Maneja el caso en el que la respuesta no es una lista
        print('Error: La respuesta no es un mapa.');
        ufinal = Ubicacion(
          id: 0,
          longitud: '',
          latitud: '',
        );
      }

      int a = 0;

/*                           PosiblesCoincidencias[0] = Ubicacion(
                              id: 0,
                              longitud: _options.first.longitude.toString(),
                              latitud: _options.first.latitude.toString(),
                              city: _options.first.displayname,
                              road: 'road',
                              country: 'country',
                              county: 'county',
                              suburb: 'suburb',
                              postcode: 'postcode',
                              favorito: false,
                              types: []);
                           */
      //upicket = Ubicacion.fromJson(data);
      // Actualizar el estado con las nuevas ubicaciones
      return ufinal;
    } else {
      throw Exception('Error al obtener información de ubicación');
    }

/*     if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      ufinal = Ubicacion.fromJson(data);

      return ufinal;
    } else {
      throw Exception('Error al obtener información de ubicación');
    } */
  } catch (e) {
    throw Exception('Error al obtener ubicación: $e');
  }
});

class LocationNotifierLite extends StateNotifier<List<Ubicacion>> {
  LocationNotifierLite(List<Ubicacion> initialLocations)
      : super(initialLocations);

  // Método para actualizar la lista con nuevas ubicaciones Posibles para seleccionar segun la entra del usuario
  void updateUbicacionesPosibles(List<Ubicacion> ubicaciones) {
    state = ubicaciones;
  }

  // Método para obtener todas las ubicaciones con la de inicio, fin y tránsito intermedias
  List<Ubicacion> getAllLocations() {
    // Verificar si hay al menos una ubicación de inicio y una de fin
    if (state.length < 2) {
      // Puedes manejar esto de acuerdo a tus necesidades, como lanzar una excepción o devolver una lista vacía.
      // Ejemplo: throw Exception('Se requieren al menos una ubicación de inicio y una de fin.');
      // O: return [];
    }

    // Obtener la ubicación de inicio y fin
    Ubicacion ubicacionInicio = state.first;
    Ubicacion ubicacionFin = state.last;

    // Obtener las ubicaciones de tránsito intermedias
    List<Ubicacion> ubicacionesDeTransito = state.sublist(1, state.length - 1);

    // Construir la lista completa de ubicaciones
    List<Ubicacion> todasLasUbicaciones = [
      ubicacionInicio,
      ...ubicacionesDeTransito,
      ubicacionFin
    ];

    return todasLasUbicaciones;
  }

//---------------------REFERENTE A LA UBICACION DE ORIGEN---------------------//
//
  // Método para actualizar la ubicación de destino
  void updateUbicacionOrigenLite(Ubicacion nuevaUbicacionOrigen) {
    // Verificar si hay ubicaciones disponibles
    if (state.isNotEmpty) {
      // Actualizar la última ubicación en la lista con la nueva ubicación de destino
      state.first = nuevaUbicacionOrigen;
    }
  }

  // Método para eliminar la ubicación de destino
  void removeUbicacionOrigenLite() {
    // Verificar si hay ubicaciones disponibles
    if (state.isNotEmpty) {
      // Eliminar la última ubicación de la lista
      state = List.from(state)..removeAt(0);
    }
  }

  // Método para obtener la ubicación de destino
  Ubicacion getUbicacionOrigenLite() {
    // Verificar si hay ubicaciones disponibles
    if (state.isEmpty) {
      // Si no hay ubicaciones, podrías devolver un valor predeterminado o lanzar una excepción según tus necesidades.
      // Ejemplo: return Ubicacion(...);
      // O: throw Exception('No hay ubicaciones disponibles.');
    }

    // Obtener una ubicación aleatoria de la lista
    Ubicacion ubicacionOrigen = state.first;

    return ubicacionOrigen;
  }

//---------------------REFERENTE A LA UBICACION DE DESTINO---------------------//
//
  // Método para actualizar la ubicación de destino
  void updateUbicacionDestinoLite(Ubicacion nuevaUbicacionDestino) {
    // Verificar si hay ubicaciones disponibles
    if (state.isNotEmpty) {
      // Actualizar la última ubicación en la lista con la nueva ubicación de destino
      state.last = nuevaUbicacionDestino;
    }
  }

  // Método para eliminar la ubicación de destino
  void removeUbicacionDestinoLite() {
    // Verificar si hay ubicaciones disponibles
    if (state.isNotEmpty) {
      // Eliminar la última ubicación de la lista
      state = List.from(state)..removeLast();
    }
  }

  // Método para obtener la ubicación de destino
  Ubicacion getUbicacionDestinoLite() {
    // Verificar si hay ubicaciones disponibles
    if (state.isEmpty) {
      // Si no hay ubicaciones, podrías devolver un valor predeterminado o lanzar una excepción según tus necesidades.
      // Ejemplo: return Ubicacion(...);
      // O: throw Exception('No hay ubicaciones disponibles.');
    }

    // Obtener una ubicación aleatoria de la lista
    Ubicacion ubicacionDestino = state.last;

    return ubicacionDestino;
  }

//---------------------REFERENTE A LA UBICACION DE TRANSITO---------------------//
//
  // Método para eliminar una sububicación de tránsito proporcionada por el usuario
  void removeSubUbicacionDeTransitoLite(Ubicacion subUbicacion) {
    // Verificar si la sububicación está presente en la lista
    if (state.contains(subUbicacion)) {
      // Eliminar la sububicación de la lista
      state = List.from(state)..remove(subUbicacion);
    }
  }

  // Método para agregar una sububicación de tránsito proporcionada por el usuario
  void addSubUbicacionDeTransitoLite(Ubicacion subUbicacion) {
    // Verificar si hay al menos dos ubicaciones (inicio y fin) en la lista
    if (state.length >= 2) {
      // Insertar la sububicación en la penúltima posición
      state = [...state.sublist(0, state.length - 1), subUbicacion, state.last];
    } else {
      // Si no hay al menos dos ubicaciones, agregar la sububicación al final
      state = [...state, subUbicacion];
    }
  }
}
