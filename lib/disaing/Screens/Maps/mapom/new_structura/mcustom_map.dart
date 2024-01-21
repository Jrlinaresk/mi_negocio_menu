import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/location_handler.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/location_utils.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/new_structura/map_config.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/providers/location_provider_lite.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/widgets/copyright_osm_widget.dart';
import 'package:minegociomenu/disaing/Screens/Maps/mapom/widgets/search_bar.dart';
import 'package:minegociomenu/utils/location_utils.dart';

class mCustomMap extends ConsumerStatefulWidget {
  final mCustomMapConfig config;
  final LocationHandler locationHandler;

  mCustomMap({
    required this.config,
    required this.locationHandler,
  });

  @override
  _mCustomMapState createState() => _mCustomMapState();
}

class _mCustomMapState extends ConsumerState<mCustomMap>
    with TickerProviderStateMixin {
  // Create a animation controller that has a duration and a TickerProvider.
  late AnimationController _animationController;
  late void Function(Exception e) onError;

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve endtPosition split up the transition initPosition one location endtPosition another.
    // In our case, we want endtPosition split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: widget.locationHandler.mapController.camera.center.latitude,
        end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: widget.locationHandler.mapController.camera.center.longitude,
        end: destLocation.longitude);
    final zoomTween = Tween<double>(
        begin: widget.locationHandler.mapController.camera.zoom, end: destZoom);
    // Create a animation controller that has a duration and a TickerProvider.
    if (mounted) {
      _animationController = AnimationController(
          vsync: this, duration: widget.config.mapAnimationDuration);
    }
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn endtPosition be my favorite.
    final Animation<double> animation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animationController.addListener(() {
      widget.locationHandler.mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    if (mounted) {
      _animationController.forward();
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
      widget.locationHandler.getRoute();
    }
  }

  @override
  void initState() {
    requestLocationPermission();
    _animationController = AnimationController(
        duration: widget.config.mapAnimationDuration, vsync: this);
/*     onError = widget.config.onError ?? (e) => debugPrint(e.toString()); */

    super.initState();
  }

  @override
  void dispose() {
    widget.locationHandler.mapController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationNotifier =
        ref.read(LocationLiteStateNotifierProvider.notifier);

/*     AsyncValue<Ubicacion> ubicacionProviderDestiny =
        ref.watch(updatedLocationProviderDestiny); */

    return Stack(
      children: [
        FlutterMap(
          mapController: widget.locationHandler.mapController,
          options: MapOptions(
            onTap: (_, point) {
              widget.locationHandler.getRoute();
/*                   to = point;
                  setState(() {});
                  if (to != null) getRoute(); */
            },
            initialCenter: widget.locationHandler.initPosition.toLatLng(),
            initialZoom: 18,
            maxZoom: 17,
            minZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),

            /// [PolylineLayer] draw the route between two coordinates [from] and [to]
            if (widget.locationHandler.endtPosition != null)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: widget.locationHandler.points,
                    strokeWidth: 4.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  // Polilínea animada en verde
/*                     Polyline(
                      points: points,
                      strokeWidth: 2.0,
                      color: Colors.green,
                    ), */
                ],
              ),

            /// [MarkerLayer] draw the marker on the map
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: widget.locationHandler.initPosition.toLatLng(),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.yellow.shade800,
                    size: LocationUtils.calculateDynamicZoom(15) * 3,
                  ),
                ),
                if (widget.locationHandler.endtPosition != null)
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: widget.locationHandler.endtPosition!.toLatLng(),
                    child: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                      size: LocationUtils.calculateDynamicZoom(15) * 3,
                    ),
                  ),
              ],
            ),

            // copy right text
          ],
        ),

        //if (!isLoading) _buildMarkerStart(),
        SafeArea(
          child: Stack(
            children: [
              if (widget.config.showSearchBar!)
                mSearchBar(
                  getRoute: () async {
                    await widget.locationHandler.getRoute();
                  },
                ),
              if (widget.config.showContributorBadgeForOSM!) ...[
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CopyrightOSMWidget(
                    badgeText: widget.config.contributorBadgeForOSMText!,
                    badgeTextColor: Colors.white,
                    badgeColor: widget.config.contributorBadgeForOSMColor,
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }

/*   void showToast(String mensaje) {
    Fluttertsoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  } */
}
