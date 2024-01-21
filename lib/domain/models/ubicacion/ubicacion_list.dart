import 'package:minegociomenu/domain/models/ubicacion/ubicacion.dart';

class UbicacionList {
  List<Ubicacion> ubicaciones;

  UbicacionList({
    required this.ubicaciones,
  });

  @override
  String toString() {
    String res = '';
    for (var current in ubicaciones) {
      res +=
          '${current.display_name}; ${current.latitud}; ${current.longitud}; ::\n';
    }
    return res;
  }

  // Constructor de fábrica para crear un objeto a partir de una cadena generada por toString
  factory UbicacionList.fromString(String str) {
    List<Ubicacion> newubicaciones = [];
    List<String> ubicacionesPart = str.split('::');
    for (var ubicacion in ubicacionesPart) {
      newubicaciones.add(Ubicacion.fromString(ubicacion));
    }
    return UbicacionList(ubicaciones: newubicaciones);
  }
}
