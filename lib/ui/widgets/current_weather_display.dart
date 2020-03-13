import 'package:flutter/material.dart';
import 'package:flutter_weather/services/api/weather_api.dart';
import 'package:flutter_weather/services/gps/geo_services.dart';
import 'package:geolocator/geolocator.dart';

WeatherApi weatherApi = WeatherApi();

class CurrentWeatherDisplay extends StatefulWidget {
  @override
  _CurrentWeatherDisplayState createState() => _CurrentWeatherDisplayState();
}

class _CurrentWeatherDisplayState extends State<CurrentWeatherDisplay> {

  _parentState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (weatherApi.currentWeather == null)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Weather data not loaded'),
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () async {
                  Position position = await getGPSCoordinates();

//                print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
                    weatherApi.getFiveDayWeather(
                        position.latitude, position.longitude);
                    weatherApi.getCurrentWeather(
                        position.latitude, position.longitude, _parentState);
                },
              )
            ],
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('${weatherApi.currentWeather.name} - ${timeOfWeather()}'),
                  subtitle: Text(weatherApi.currentWeather.weather[0].description),
                  trailing: IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () async {
                      //ToDo - Change icon to spinner while this is happening, and prevent further taps.
                      Position position = await getGPSCoordinates();
                      weatherApi.getCurrentWeather(position.latitude, position.longitude, _parentState);
                    },
                  ),
                ),
                Center(
                  child: Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
                ),
                Center(
                  child: Text(getTemperature(weatherApi.currentWeather.main.temp)),
                ),
                Center(
                  child: Text('Feels like ${getTemperature(weatherApi.currentWeather.main.feelsLike)}'),
                )
              ],
            ),
          );
  }

  getTemperature(double temp) {
    return '${temp.round().toString()} °F';
  }

  // Note that the server caches responses, so we can't always fetch a new weather response.
  timeOfWeather() {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(weatherApi.currentWeather.dt * 1000);
    if (dt.hour > 12) {
      print('${dt.hour}:${dt.minute}');
      return '${dt.hour - 12}:${dt.minute}pm';
    } else {
      return '${dt.hour}:${dt.minute}am';
    }
  }
}
