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

  Map<String, String> weatherColors = {
    '01d':'3F3F3F',
    '01n':'FFF36D',
    '02d':'7D7D7D',
    '02n':'FFFBF2',
    '03d':'B8B8B8',
    '03n':'E5F9F7',
    '04d':'818181',
    '04n':'C5DEDC',
    '09d':'8AA4BB',
    '09n':'B6C9DA',
    '10d':'73818D',
    '10n':'97A7B5',
    '11d':'6C7877',
    '11n':'8CA7A5',
    '13d':'C4C4C4',
    '13n':'F5F5F5',
    '50d':'ABC0C0',
    '50n':'EFF6F6',
  };

  getWeatherImage(imageName) {
    return weatherImages[imageName];
  }

  getWeatherColor(imageName) {
    return _getColorFromHex(weatherColors[imageName]);
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}