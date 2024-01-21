import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class mCustomMapConfig {
  final String? urlTemplate;
  final double? stepZoom;
  final double? minZoomLevel;
  final double? maxZoomLevel;
  final LatLngBounds? maxBounds;
  bool? trackMyPosition;
  final Duration? mapAnimationDuration;
  final Color? mapLoadingBackgroundColor;
  bool? showSearchBar;
  final bool? showContributorBadgeForOSM;
  final Color? contributorBadgeForOSMColor;
  final String? contributorBadgeForOSMText;
  //
  final Widget? loadingWidget;
  final bool? showCurrentLocationPointer;
  final bool? showZoomController;
  final bool? showLocationController;

  mCustomMapConfig({
    this.stepZoom = 1,
    this.minZoomLevel = 13,
    this.maxZoomLevel = 17,
    this.maxBounds,
    this.urlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    this.mapAnimationDuration = const Duration(milliseconds: 2000),
    this.trackMyPosition = true,
    this.showSearchBar = true,
    this.mapLoadingBackgroundColor,
    this.showContributorBadgeForOSM = false,
    this.contributorBadgeForOSMColor,
    this.contributorBadgeForOSMText = 'OpenStreetMap contributors',
    //
    this.showZoomController = true, //unimplement
    this.showLocationController = true, //unimplement
    this.showCurrentLocationPointer = true,
    Widget? loadingWidget,
  }) : loadingWidget = loadingWidget ?? const CircularProgressIndicator();
}
