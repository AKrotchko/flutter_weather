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
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Text('Day of Week'),
                    children: <Widget>[
                      Container(
                        height: 64,
                        child: ListTile(
                          title: Image.network(
                              'http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
                        ),
                      )
                    ],
                  )
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

/*
Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
              Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
              Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
              Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png'),
              Image.network('http://openweathermap.org/img/wn/${weatherApi.currentWeather.weather[0].icon}.png')
            ],
          ),
 */
