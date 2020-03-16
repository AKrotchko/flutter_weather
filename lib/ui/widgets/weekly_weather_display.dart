import 'package:flutter/material.dart';

import 'current_weather_display.dart';

class WeeklyWeatherDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, i) {
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                  color: Colors.white, child: DayOfWeekWeatherDisplay((8 * i))
//          ListTile(
//              title: Text('Day of Week'),
//            trailing: Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
//          ),
                  ));
        },
        itemCount: 5,
        shrinkWrap: true,
      ),
    );
  }
}

class DayOfWeekWeatherDisplay extends StatelessWidget {
  DayOfWeekWeatherDisplay(this.start);

  final start;

//  weatherApi.fiveDayForecast.list
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Day of Week'),
      children: <Widget>[
        Container(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 1].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 2].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 3].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 4].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 5].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 6].weather[0].icon}.png'),
              Image.network(
                  'http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[start + 7].weather[0].icon}.png'),
            ],
          ),
        )
      ],
    );
  }
}

/*

 */
