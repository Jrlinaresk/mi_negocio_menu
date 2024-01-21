class SolicitudDeEnvio {
  final String id; //numero de telefono del remitente
  final double longitud;
  final double latitud;
  final double monto;
  final String NumeroDeCasa;

  SolicitudDeEnvio({
    required this.id,
    required this.longitud,
    required this.latitud,
    required this.monto,
    required this.NumeroDeCasa,
  });
}
