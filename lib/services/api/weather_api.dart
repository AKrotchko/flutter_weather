import 'package:flutter_weather/data/current_weather.dart';
import 'package:flutter_weather/data/five_day_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApi {

  CurrentWeather currentWeather;
  FiveDayForecast _fiveDayForecast;

  final String _baseURL = 'api.openweathermap.org';
  final String _path = '/data/2.5';
  final String _weatherEndpoint = '/weather';
  final String _forecastEndpoint = '/forecast';
  final String _apiKey = '5b052ca827fe7cf71e7de4c6d9f0c935'; // This API key is not safe here, would store externally.


  // 5 day / 3 hour weather report
  getFiveDayWeather(double latitude, double longitude) async {
    // If the forecast has not been polled, or it has not been polled in 5 minutes, poll it again
    if (_fiveDayForecast == null || DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(_fiveDayForecast.list[0].dt * 1000)).inMinutes >= 5) {

    }
    Uri uri = buildUri(_forecastEndpoint, latitude, longitude);

    http.Response response = await http.get(uri);
    _fiveDayForecast = fiveDayForecastFromJson(response.body);
    print(DateTime.fromMillisecondsSinceEpoch(_fiveDayForecast.list[0].dt * 1000));
    print('I got a five day forecast');
  }

  getCurrentWeather(double latitude, double longitude, parentState) async {
    // If the current weather has not been polled, or it has not been polled in 5 minutes, poll it again
    if (currentWeather == null || DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000)).inMinutes >=  5) {
      Uri uri = buildUri(_weatherEndpoint, latitude, longitude);

      http.Response response = await http.get(uri);
      currentWeather = currentWeatherFromJson(response.body);
      print('I got the current forecast');
      print(currentWeather?.dt);
    } else {
      print('Current forecast already exists and is only ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000)).inMinutes} minutes old');
    }

    parentState();
  }

  Uri buildUri(String endpoint, double latitude, double longitude) {
    return Uri(
      scheme: 'https',
      host: _baseURL,
      path: '$_path$endpoint',
      queryParameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'apiKey': _apiKey,
        'units': 'imperial'
      }
    );
  }
}
