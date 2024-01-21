import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/new_structura/location_utils.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/providers/location_provider_lite.dart';
import 'package:osrm/osrm.dart';

class LocationHandler {
  final void Function(PickedData pickedData)? onChanged;
  final void Function(PickedData pickedData)? onPicked;
  final void Function(Exception e)? onError;
  LatLong initPosition;
  LatLong? endtPosition;
  final Widget? markerIcon;
  final double? markerIconOffset;
  MapController mapController;
  final bool trackMyPosition;

  LocationHandler({
    this.onError,
    this.onChanged,
    required this.onPicked,
    required this.mapController,
    required this.initPosition,
    this.endtPosition,
    this.markerIcon,
    this.markerIconOffset = 50.0,
    this.trackMyPosition = true,
  });

  /// [distance] the distance between two coordinates [from] and [to]
  double distance = 0.0;

  /// [duration] the duration between two coordinates [from] and [to]
  num duration = 0.0;
  var points = <LatLng>[];
  var isLoading = false;

  void Casas() {
    /// Checking if the trackMyPosition is true or false. If it is true, it will get the current
    /// position of the user and set the initLate and initLong endtPosition the current position. If it is false,
    /// it will set the initLate and initLong endtPosition the [initPosition].latitude and
    /// [initPosition].longitude.
    if (trackMyPosition!) {
      _determinePosition().then((currentPosition) {
        initPosition =
            LatLong(currentPosition.latitude, currentPosition.longitude);

        onLocationChanged(initPosition!);
        _animatedMapMove(initPosition!, 18.0);
      });
    } else if (initPosition != null) {
      initPosition = LatLong(initPosition!.latitude, initPosition!.longitude);
      onLocationChanged(initPosition!);
      isLoading =
          false; //crear una ruta para que muestre la vista de vargando cuando sea true
    } else {
      onLocationChanged(initPosition!);
      isLoading = false;
    }
  }

  void _animatedMapMove(LatLong destLocation, double destZoom) {
    // Lógica para mover animadamente el mapa
  }

  Widget _buildMarkerStart() {
    return Positioned.fill(
      bottom: markerIconOffset,
      child: IgnorePointer(
        child: Center(
          child: markerIcon ??
              const Icon(
                Icons.location_pin,
                color: Colors.blue,
                size: 50,
              ),
        ),
      ),
    );
  }

  void onLocationChanged(LatLong latLng) {
    pickData(latLng).then(
      (value) {
/*         onChanged!(value); */
      },
    );
  }

  Future<void> getRoute() async {
    /// Creating a new instance of the MapController class.
    mapController = MapController();

    /// The above code is listening endtPosition the mapEventStream and when the mapEventMoveEnd event is
    /// triggered, it calls the setNameCurrentPos function.
    mapController.mapEventStream.listen((event) async {
      if (event is MapEventMoveEnd) {
        LatLong center = LatLong(
            event.camera.center.latitude, event.camera.center.longitude);
        onLocationChanged(center);
      }
    });
    final ubicacionDestinoProvider = LocationLiteStateNotifierProvider.notifier;

/*     final ubicacionDestino =
        ref.watch(ubicacionDestinoProvider).getUbicacionDestino(); */
/*     to =
        ref.watch(LocationLiteStateNotifierProvider.notifier).getUbicacionDestino(); */
    int a = 0;

    final osrm = Osrm(
      source: OsrmSource(
        serverBuilder: OpenstreetmapServerBuilder().build,
      ),
    );
    // get the route
    final options = RouteRequest(
      coordinates: [
        (initPosition.longitude, initPosition.latitude),
        (endtPosition!.longitude, endtPosition!.latitude),
      ],
      profile:
          OsrmRequestProfile.foot, // Puedes cambiar esto según tus necesidades
      geometries: OsrmGeometries.geojson,
      overview: OsrmOverview.simplified,
      // alternatives: OsrmAlternative.number(2),
      // annotations: OsrmAnnotation.true_,
      steps: false, // Desactivar los pasos detallados de la ruta
      annotations:
          OsrmAnnotation.false_, // Desactivar las anotaciones detalladas
      alternatives: OsrmAlternative.false_, // No solicitar rutas alternativas
    );
    final route = await osrm.route(options);
    var location;
    distance = route.routes.first.distance!.toDouble();
    duration = route.routes.first.duration!;
    points = route.routes.first.geometry!.lineString!.coordinates.map((e) {
      location = e.toLocation();
      return LatLong(location.lat, location.lng).toLatLng();
    }).toList();
    if (kDebugMode) {
      print(points);
    }

    mapController.move(
        LocationUtils.calculateCenter(initPosition, endtPosition!)
            as LatLng, //as LatLng, no estaba
        LocationUtils.calculateDynamicZoom((distance / 1000)));
  }

  Future<PickedData> pickData(LatLong center) async {
    var client = http.Client();
    String url =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${center.latitude}&lon=${center.longitude}&zoom=18&addressdetails=1&accept-language=${'es'}';
    var response = await client.get(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    String displayName = "This Location is not accessible";
    Map<String, dynamic> address;

    if (decodedResponse['display_name'] != null) {
      displayName = decodedResponse['display_name'];
      address = decodedResponse['address'];
    } else {
      center = const LatLong(0, 0);
      address = decodedResponse as Map<String, dynamic>;
    }
    return PickedData(center, displayName, address);
  }

  Future<void> determinePositionAndAnimateMap() async {
    // Lógica para determinar la posición y animar el mapa
    final currentPosition = await _determinePosition();
    final initPosition =
        LatLong(currentPosition.latitude, currentPosition.longitude);
    final center = LocationUtils.calculateCenter(initPosition, endtPosition!);
/*   _animatedMapMove(center, 18.0); */
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      const error = PermissionDeniedException("Location Permission is denied");
      // Aquí puedes manejar el error de permisos según tus necesidades
      throw error;
    }

    if (permission == LocationPermission.deniedForever) {
      const error =
          PermissionDeniedException("Location Permission is denied forever");
      // Aquí puedes manejar el error de permisos según tus necesidades
      throw error;
    }

    // Verificar si los servicios de ubicación están habilitados
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Abrir la configuración de ubicación para que el usuario lo habilite
      await Geolocator.openLocationSettings();

      // Esperar hasta que los servicios de ubicación estén habilitados
      while (!await Geolocator.isLocationServiceEnabled()) {}
    }

    // Obtener la posición actual
    return await Geolocator.getCurrentPosition();
  }
}
