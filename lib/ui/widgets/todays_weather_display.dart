import 'package:flutter/material.dart';
import 'package:flutter_weather/services/images/weather_image.dart';
import 'package:flutter_weather/ui/home_screen.dart';
import 'package:geolocator/geolocator.dart';

import '../../services/gps/geo_services.dart';
import 'current_weather_display.dart';
import 'hourly_weather_display.dart';

class TodaysWeatherDisplay extends StatelessWidget {
  TodaysWeatherDisplay(this._parentState);

  final _parentState;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        color: Colors.white30,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                  '${weatherApi.currentWeather.name} - ${timeOfWeather()}'),
              subtitle: Row(
                children: <Widget>[
                  Text(weatherApi.currentWeather.weather[0].description),
                  FavoriteButton(weatherApi.currentWeather.name),
                ],
              ),
              trailing: IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () async {
                      //ToDo - Change icon to spinner while this is happening, and prevent further taps.
                      Position position = await getGPSCoordinates();
                      weatherApi.getCurrentWeather(
                          position.latitude, position.longitude, _parentState);
                      weatherApi.getFiveDayWeather(
                          position.latitude, position.longitude, _parentState);
                    },
              ),
            ),
            Center(
                child: Container(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width / 4,
              child: FittedBox(
                child: Image.asset(
                  'assets/images/${WeatherImage().getWeatherImage(weatherApi.currentWeather.weather[0].icon)}.png',
                  color: Colors.black,
                ),
                fit: BoxFit.fill,
              ),
            )),
            Center(
              child: Text(getTemperature(weatherApi.currentWeather.main.temp)),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                    'Feels like ${getTemperature(weatherApi.currentWeather.main.feelsLike)}'),
              ),
            ),
            Center(child: HourlyWeatherDisplay())
          ],
        ),
      ),
    );
  }

  /*
        padding: EdgeInsets.all(5.0),

   */
  // Note that the server caches responses, so we can't always fetch a new weather response.
  timeOfWeather() {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(
        weatherApi.currentWeather.dt * 1000);
    if (dt.hour > 12) {
      if (dt.minute < 10) {
        return '${dt.hour - 12}:0${dt.minute}pm';
      }
      return '${dt.hour - 12}:${dt.minute}pm';
    } else {
      if (dt.minute < 10) {
        return '${dt.hour}:0${dt.minute}am';
      }
      return '${dt.hour}:${dt.minute}am';
    }
  }

  getTemperature(double temp) {
    return '${temp.round().toString()} °F';
  }
}

class FavoriteButton extends StatefulWidget {
  FavoriteButton(this.name);

  final name;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState(name);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  _FavoriteButtonState(this.name);

  final name;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    if (storageService.savedZips.contains(weatherApi.currentWeather.name)) {
      print('We already got it, boss');

      setState(() {
        isFavorite = true;
      });
    } else {
      print('its not my favorite');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isFavorite ? Icon(Icons.star) :Icon(Icons.star_border),
      onPressed: () async {
        setFavorite();
      },
    );
  }

  setFavorite() {
    if (!isFavorite) {
      storageService.savedPlaces.add(weatherApi.currentWeather.name);
    } else {
      storageService.savedPlaces.remove(weatherApi.currentWeather.name);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
