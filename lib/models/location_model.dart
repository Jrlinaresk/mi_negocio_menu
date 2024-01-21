import 'package:uuid/uuid.dart';

class LocationModel {
  final String id = const Uuid().v4();
  final String? display_name = '';
  final double lat;
  final double lon;
  final String? city = '';
  final String? road = '';
  final String? country = '';
  final String? county = '';
/*   final String state; */
  final String? suburb = '';
  final String? postcode = '';
  //para control interno
  final bool? favorito = false;
  final List<String>? types = [];

  LocationModel({required this.lat, required this.lon});

  // Puedes añadir métodos u otros constructores según tus necesidades
}
