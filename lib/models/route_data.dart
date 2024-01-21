import 'package:minegociomenu/models/coordinate.dart';
import 'package:minegociomenu/models/location_model.dart';

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
