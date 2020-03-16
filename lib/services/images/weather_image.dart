class WeatherImage {

  Map<String, String> weatherImages = {
    '01d':'icon_sun',
    '01n':'icon_sun',
    '02d':'icon_cloud_sun',
    '02n':'icon_cloud_sun',
    '03d':'icon_cloud',
    '03n':'icon_cloud',
    '04d':'icon_cloud',
    '04n':'icon_cloud',
    '09d':'icon_cloud_little_rain',
    '09n':'icon_cloud_little_rain',
    '10d':'icon_rain',
    '10n':'icon_rain',
    '11d':'icon_thunderstorm',
    '11n':'icon_thunderstorm',
    '13d':'icon_snow',
    '13n':'icon_snow',
    '50d':'icon_dust',
    '50n':'icon_dust',
  };

  getWeatherImage(imageName) {
    return weatherImages[imageName];
  }
}