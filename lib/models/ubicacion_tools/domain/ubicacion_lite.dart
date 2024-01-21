class UbicacionLite {
  String display_name;
  double longitud;
  double latitud;

  UbicacionLite({
    required this.display_name,
    required this.longitud,
    required this.latitud,
  });

  @override
  String toString() {
    return '$display_name, $longitud, $latitud';
  }

  // Constructor de fábrica para crear un objeto a partir de una cadena generada por toString
  factory UbicacionLite.fromString(String str) {
    List<String> partes = str.split('; ');
    if (partes.length == 4) {
      UbicacionLite s = UbicacionLite(
        display_name: partes[0],
        latitud: double.parse(partes[1]),
        longitud: double.parse(partes[2]),
      );
      return s;
    } else {
      // Manejo de errores si la cadena no es válida
      throw FormatException('Formato de cadena no válido para MiObjeto: $str');
    }
  }
}
