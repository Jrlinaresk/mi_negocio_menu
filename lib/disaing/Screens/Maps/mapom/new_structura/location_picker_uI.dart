import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/location_handler.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/location_utils.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/map_config.dart';

// Definición de MarkerDirection para determinar la dirección del marcador.
enum MarkerDirection {
  heading, // Utilizado para indicar la dirección del encabezado (heading).
  // Otros valores posibles según tus requisitos.
}

class LocationPickerUI {
  final mCustomMapConfig config;
  final LocationHandler locationHandler;

  LocationPickerUI({required this.config, required this.locationHandler});

  Widget _buildMap() {
    return Positioned.fill(
      child: FlutterMap(
        options: MapOptions(
          initialCenter: locationHandler.initPosition!.toLatLng(),
          initialZoom: LocationUtils.calculateDynamicZoom(
              (locationHandler.distance / 1000)),
          maxZoom: config.maxZoomLevel,
          minZoom: config.minZoomLevel,
          cameraConstraint: (config.maxBounds != null
              ? CameraConstraint.contain(bounds: config.maxBounds!)
              : const CameraConstraint.unconstrained()),
          backgroundColor:
              config.mapLoadingBackgroundColor ?? const Color(0xFFE0E0E0),
          keepAlive: true,
        ),
        mapController: locationHandler.mapController,
        children: [
          TileLayer(
            urlTemplate: config.urlTemplate,
            subdomains: const ['a', 'b', 'c'],
/*             tileProvider: CancellableNetworkTileProvider(), */
          ),
          if (config.showCurrentLocationPointer!) _buildCurrentLocation(),
        ],
      ),
    );
  }

  Widget _buildCurrentLocation() {
    return const CurrentLocationLayer(
      style: LocationMarkerStyle(
        markerDirection: MarkerDirection.heading,
        headingSectorRadius: 60,
        markerSize: Size(18, 18),
      ),
    );
  }

  Widget _buildSelectPossition() {
    return const Positioned(
      //                isLoading = true; ...cada vez q haga una operacion de marcado
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}

// Clase para definir el estilo del marcador de ubicación.
class LocationMarkerStyle {
  final MarkerDirection markerDirection;
  final double headingSectorRadius;
  final Size markerSize;

  const LocationMarkerStyle({
    required this.markerDirection,
    required this.headingSectorRadius,
    required this.markerSize,
  });
}

// Widget que representa la capa de la ubicación actual en el mapa.
class CurrentLocationLayer extends StatelessWidget {
  final LocationMarkerStyle style;

  const CurrentLocationLayer({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Aquí puedes implementar la lógica para mostrar la ubicación actual en el mapa
    // utilizando los valores proporcionados en `style`.
    // Por ejemplo, puedes usar un Icon con la rotación adecuada según la dirección.

    return Container(
      // Implementa la representación visual de la ubicación actual aquí.
      // Puedes usar un Icon y aplicar la rotación según la dirección.
      child: Icon(
        Icons.location_on,
        size: style.markerSize.width,
        color: Colors.blue,
      ),
    );
  }
}
