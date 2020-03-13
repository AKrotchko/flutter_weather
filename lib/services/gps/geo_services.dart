
import 'package:geolocator/geolocator.dart';

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
  return await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
