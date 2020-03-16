import 'package:flutter/material.dart';
import 'package:flutter_weather/ui/widgets/current_weather_display.dart';

class HourlyWeatherDisplay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        OneHourWeather(0),
        OneHourWeather(1),
        OneHourWeather(2),
        OneHourWeather(3),
        OneHourWeather(4),
        OneHourWeather(5),
        OneHourWeather(6),
        OneHourWeather(7),
      ],
    );
  }
}

class OneHourWeather extends StatelessWidget {
  OneHourWeather(this.hour);

  final int hour;

  @override
  Widget build(BuildContext context) {

//    if (weatherApi != null) {
//      print(weatherApi.fiveDayForecast.list.length);
//    } else {
////      weatherApi.getFiveDayWeather(latitude, longitude)
//    }

    print(weatherApi.fiveDayForecast.list[hour].dt);

    DateTime current = DateTime.fromMillisecondsSinceEpoch(weatherApi.fiveDayForecast.list[hour].dt * 1000);

    String currentTime = '';

    if (current.hour > 12) {
      currentTime = '${current.hour - 12}pm';
    } else {
      currentTime = '${current.hour}am';
    }

//  print(weatherApi.fiveDayForecast?.city?.name);
//  print(weatherApi.fiveDayForecast.list[start].dt)

    // ${weatherApi.fiveDayForecast.list[hour].main.temp.round() °F

    return Column(
      children: <Widget>[
        Center(
          child: Text(currentTime),
        ),
        Center(
          child: Image.network('http://openweathermap.org/img/wn/${weatherApi.fiveDayForecast.list[hour].weather[0].icon}.png'),
        ),
        Center(
          child: Text('${weatherApi.fiveDayForecast.list[hour].main.temp.round()} °F'),
        )
      ],
    );
  }
}
