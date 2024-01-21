import 'package:latlong2/latlong.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class LocationUtils {
  static double calculateDynamicZoom(double distance) {
    // Ajusta este valor según sea necesario
    const double zoomFactor = 10.0;

    // Calcula el zoom en función de la distancia
    double zoom = zoomFactor / distance;

    if (distance < 1) {
      return 18;
    } else if (distance > 8) {
      return 13;
    } else {
      return 15;
    }
  }

  static LatLong calculateCenter(LatLong initPosition, LatLong endtPosition) {
    double centerLatitude = (initPosition.latitude + endtPosition.latitude) / 2;
    double centerLongitude =
        (initPosition.longitude + endtPosition.longitude) / 2;

    return LatLong(centerLatitude, centerLongitude);
  }
}
