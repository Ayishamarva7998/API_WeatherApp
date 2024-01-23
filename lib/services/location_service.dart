import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
    // ignore: body_might_complete_normally_nullable
    Future<Placemark?> getLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          return placemarks[0];
        }
      } catch (e) {
        // ignore: avoid_print
        print("Error fetching location name");
      }

      return null;
    }
  }
}