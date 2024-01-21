import 'package:minegociomenu/domain/models/ubicacion_tools/domain/ubicacion_lite.dart';

class UbicacionList {
  List<UbicacionLite> ubicaciones;

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
    List<UbicacionLite> newubicaciones = [];
    List<String> ubicacionesPart = str.split('::');
    for (var ubicacion in ubicacionesPart) {
      newubicaciones.add(UbicacionLite.fromString(ubicacion));
    }
    return UbicacionList(ubicaciones: newubicaciones);
  }
}
