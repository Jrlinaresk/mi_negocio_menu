import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/new_structura/location_handler.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/new_structura/location_utils.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/new_structura/map_config.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/new_structura/mcustom_map.dart';
import 'package:minegociomenu/presentation/Screens/globals/08buttom_nav_bar/Maps/mapom/providers/location_provider_lite.dart';
import 'package:minegociomenu/presentation/Screens/globals/09drawer/SettingsScreen.dart';
import 'package:minegociomenu/domain/models/ubicacion/ubicacion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MapaScreen extends ConsumerStatefulWidget {
  const MapaScreen({super.key});

  @override
  MapaScreenState createState() => MapaScreenState();
}

class MapaScreenState extends ConsumerState<MapaScreen> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<Ubicacion> ubicacionProvider =
        ref.watch(updatedLocationProviderClient);

    //boorrar en la version final esto
    double originalLat = double.parse(ubicacionProvider.value!.latitud);
    double originalLng = double.parse(ubicacionProvider.value!.longitud);

    double desplazamientoMetros = 200;

    double nuevaLatitud = originalLat +
        (desplazamientoMetros / 111111); // 1 grado de latitud ≈ 111111 metros
    double nuevaLongitud = originalLng;

//

    MapController _mapController = MapController();
    late LocationHandler locationHandler = LocationHandler(
      onPicked: null,
      mapController: _mapController,
      initPosition: LatLong(nuevaLatitud, nuevaLongitud),
      endtPosition: LatLong(originalLat, originalLng),
    );

    locationHandler.getRoute();

    return MaterialApp(
      title: 'Flutter Location Picker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: mCustomMap(
          config: mCustomMapConfig(showSearchBar: false),
          locationHandler: locationHandler,
        ),
      ),
    );
  }
}
