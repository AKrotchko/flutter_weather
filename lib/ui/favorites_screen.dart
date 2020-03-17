import 'package:flutter/material.dart';
import 'package:flutter_weather/services/images/weather_image.dart';
import 'package:flutter_weather/ui/home_screen.dart';
import 'package:flutter_weather/ui/widgets/current_weather_display.dart';

class FavoritesList extends StatefulWidget {
  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  List<String> savedZips = List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(WeatherImage()
          .getWeatherColor(weatherApi.currentWeather.weather[0].icon)),
      child: savedZips.length <= 0
          ? Container(
              child: Center(child: Text('You have no favorites!')),
            )
          : Center(
              child: Container(
                child: ListView.builder(itemBuilder: (context, i) {

                  return ListTile();
                },
                itemCount: savedZips.length,
                ),
              ),
            ),
    );
  }

  getStoredZips() async {
    savedZips = storageService.getSavedAddresses();
  }
}
