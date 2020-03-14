
import 'package:geolocator/geolocator.dart';

Geolocator geolocator = Geolocator();

checkGPSPermissions() async {
  GeolocationStatus geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();

  if (geolocationStatus == GeolocationStatus.granted) {
    return true;
  }

  return false;
}

requestGPSPermissions() async {
//  GeolocationPermission permission = await Geolocator().
}

getGPSCoordinates() async {
  return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
