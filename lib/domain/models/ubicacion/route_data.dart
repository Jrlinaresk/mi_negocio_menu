import 'package:minegociomenu/domain/models/ubicacion/coordinate.dart';
import 'package:minegociomenu/domain/models/ubicacion/location_model.dart';

class RouteData {
  bool? tracking = true;
  LocationModel? startPosition;
  String? startPositionAddress;
  LocationModel? endPosition;
  String? endPositionAddress;
  List<Coordinate>? tripRoute;
  List<Coordinate>? tripStops;

  RouteData();
}
