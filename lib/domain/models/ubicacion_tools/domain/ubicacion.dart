import 'package:latlong2/latlong.dart';

class Ubicacion {
  final int id;
  final String? display_name;
  final String longitud;
  final String latitud;
  final String city;
  final String road;
  final String country;
  final String county;
/*   final String state; */
  final String suburb;
  final String postcode;
  //para control interno
  final bool favorito;
  final List<String> types;

  Ubicacion({
    required this.id,
    required this.display_name,
    required this.longitud,
    required this.latitud,
    required this.city,
    required this.road,
    required this.country,
    required this.county,
/*     required this.state, */
    required this.suburb,
    required this.postcode,
    required this.favorito,
    required this.types,
  });

  factory Ubicacion.fromJson(Map<String, dynamic> json) {
    return Ubicacion(
        id: 0,
        longitud: json['lon'],
        latitud: json['lat'],
        display_name: json['display_name'],
        country: json['address']['country'],
        county: json['address']['county'],
/*         state: json['address']['state'], */
        city: json['address']['city_district'],
        suburb: json['address']['suburb'],
        road: json['address']['road'],
        postcode: json['address']['postcode'],
        favorito: false,
        types: []);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'longitud': longitud,
      'latitud': latitud,
      'display_name': display_name,
      'city': city,
      'road': road,
      'country': country,
      'county': county,
/*       'descripcion': state, */
      'suburb': suburb,
      'postcode': postcode,
      'favorito': favorito,
      'types': types
    };
  }

  Ubicacion copyWith(
      {int? id,
      String? longitud,
      String? latitud,
      String? display_name,
      String? city,
      String? road,
      String? country,
      String? county,
/*       String? state, */
      String? suburb,
      String? postcode,
      bool? favorito,
      List<String>? types}) {
    return Ubicacion(
      id: id ?? this.id,
      longitud: longitud ?? this.longitud,
      latitud: latitud ?? this.latitud,
      display_name: display_name ?? this.display_name,
      city: city ?? this.city,
      road: road ?? this.road,
      country: country ?? this.country,
      county: county ?? this.county,
/*       state: state ?? this.state, */
      suburb: suburb ?? this.suburb,
      postcode: postcode ?? this.postcode,
      favorito: favorito ?? this.favorito,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'longitud': longitud,
      'latitud': latitud,
      'displayname': display_name,
      'city': city,
      'road': road,
      'country': country,
      'county': county,
/*       'state': state, */
      'suburb': suburb,
      'postcode': postcode,
      'favorito': favorito,
      'types': types
    };
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();
    final lowercaseName = latitud.toString().toLowerCase();
    return lowercaseName.contains(lowercaseSearch);
  }

  @override
  String toString() {
    return '$display_name, $longitud, $longitud';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Ubicacion && other.display_name == display_name;
  }

  @override
  int get hashCode => Object.hash(display_name, longitud, longitud);
}

/* class LatLong {
  final double latitude;
  final double longitude;
  const LatLong(this.latitude, this.longitude);
  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

class PickedData {
  final LatLong latLong;
  final String address;
  final Map<String, dynamic> addressData;

  const PickedData(this.latLong, this.address, this.addressData);
}
 */