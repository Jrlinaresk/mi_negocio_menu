import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/presentation/Screens/Maps/mapom/providers/location_provider_lite.dart';
import 'package:minegociomenu/domain/models/ubicacion_tools/domain/ubicacion.dart';

final UbicacionDelUsuario =
    StateNotifierProvider<LocationNotifierLite, AsyncValue<Ubicacion>>((ref) {
  return LocationNotifierLite();
});

class LocationNotifierLite extends StateNotifier<AsyncValue<Ubicacion>> {
  LocationNotifierLite()
      : super(updatedLocationProviderClient as AsyncValue<
            Ubicacion>); // Puedes ajustar el valor inicial según tus necesidades

  // Método para actualizar la ubicación ACTUAL DEL USUARIO
  void updateUbicacionesLiteActualDelUsuario(Ubicacion ubicacion) {
    state = ubicacion as AsyncValue<Ubicacion>;
  }
}
