import 'package:flutter/material.dart';
import 'package:flutter_weather/data/five_day_forecast.dart';

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
                  color: Colors.white30, child: DayOfWeekWeatherDisplay((8 * i))
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
      backgroundColor: Colors.white30,
//      trailing: getTrailing(),
      title: Text(getDate()),
      children: <Widget>[
        Container(
          height: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getWeatherColumn(weatherApi.fiveDayForecast.list[start]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 1]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 2]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 3]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 4]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 5]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 6]),
              getWeatherColumn(weatherApi.fiveDayForecast.list[start + 7]),
            ],
          ),
        )
      ],
    );
  }

  getWeatherColumn(weather) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(getTime(weather)),
        ),
        Center(
          child: Image.network('http://openweathermap.org/img/wn/${weather.weather[0].icon}.png'),
        ),
        Center(
          child: Text('${weather.main.temp.round()} °F'),
        )
      ],
    );
  }

  getTrailing() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
//          child: Image.network('http://openweathermap.org/img/wn/${weather.weather[0].icon}.png'),
          child: Image.network('http://openweathermap.org/img/wn/01d.png'),
        ),
        Center(
          child: Text('${averageTemp()} °F'),
        )
      ],
    );
  }

  getTime(weather) {
    DateTime current = DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000);

    String currentTime = '';

    if (current.hour > 12) {
      currentTime = '${current.hour - 12}pm';
    } else {
      currentTime = '${current.hour}am';
    }

    return currentTime;
  }

  getDate() {
    var dateString = '';

    switch (weatherApi.fiveDayForecast.list[start].dtTxt.weekday) {
      case 1: {
        dateString += 'Monday, ';
        break;
      }
      case 2: {
        dateString += 'Tuesday, ';
        break;
      }
      case 3: {
        dateString += 'Wednesday, ';
        break;
      }
      case 4: {
        dateString += 'Thursday, ';
        break;
      }
      case 5: {
        dateString += 'Friday, ';
        break;
      }
      case 6: {
        dateString += 'Saturday, ';
        break;
      }
      case 7: {
        dateString += 'Sunday, ';
        break;
      }
    }

    switch (weatherApi.fiveDayForecast.list[start].dtTxt.month) {
      case 1: {
        dateString += 'January ';
        break;
      }
      case 2: {
        dateString += 'February ';
        break;
      }
      case 3: {
        dateString += 'March ';
        break;
      }
      case 4: {
        dateString += 'April ';
        break;
      }
      case 5: {
        dateString += 'May ';
        break;
      }
      case 6: {
        dateString += 'June ';
        break;
      }
      case 7: {
        dateString += 'July ';
        break;
      }
      case 8: {
        dateString += 'August ';
        break;
      }
      case 9: {
        dateString += 'September ';
        break;
      }
      case 10: {
        dateString += 'October ';
        break;
      }
      case 11: {
        dateString += 'November ';
        break;
      }
      case 12: {
        dateString += 'December ';
        break;
      }
    }

    dateString += weatherApi.fiveDayForecast.list[start].dtTxt.day.toString();

    return dateString;
  }

  averageTemp() {
    return 50;
  }

  averageImage() {

  }
}

/*

 */
