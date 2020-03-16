import 'package:flutter/material.dart';
import 'package:flutter_weather/services/api/weather_api.dart';
import 'package:flutter_weather/services/gps/geo_services.dart';
import 'package:flutter_weather/services/images/weather_image.dart';
import 'package:flutter_weather/ui/widgets/hourly_weather_display.dart';
import 'package:flutter_weather/ui/widgets/todays_weather_display.dart';
import 'package:flutter_weather/ui/widgets/weekly_weather_display.dart';
import 'package:geolocator/geolocator.dart';

WeatherApi weatherApi = WeatherApi();

class CurrentWeatherDisplay extends StatefulWidget {
  @override
  _CurrentWeatherDisplayState createState() => _CurrentWeatherDisplayState();
}

class _CurrentWeatherDisplayState extends State<CurrentWeatherDisplay> {

  bool isCurrentSelected = true;

  _parentState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getWeatherOnStartup();
  }

  getWeatherOnStartup() async {
    Position position = await getGPSCoordinates();
    weatherApi.getCurrentWeather(
        position.latitude, position.longitude, _parentState);
    weatherApi.getFiveDayWeather(position.latitude, position.longitude, _parentState);
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
                      position.latitude, position.longitude, _parentState);
                  weatherApi.getCurrentWeather(
                      position.latitude, position.longitude, _parentState);
                },
              )
            ],
          )
        : Container(
      color: Color(WeatherImage().getWeatherColor(weatherApi.currentWeather.weather[0].icon)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
                        color: isCurrentSelected ? Colors.black : Colors.white,
                        onPressed: (){
                          setState(() {
                            isCurrentSelected = true;
                          });
                        },
                        child: Text('Current Weather', style: TextStyle(color: isCurrentSelected ? Colors.white : Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
                        color: isCurrentSelected ? Colors.white : Colors.black,
                        onPressed: (){
                          setState(() {
                            isCurrentSelected = false;
                          });
                        },
                        child: Text('5-Day Forecast', style: TextStyle(color: isCurrentSelected ? Colors.black : Colors.white)),
                      ),
                    ),
                  ],
                ),
                isCurrentSelected ? TodaysWeatherDisplay(_parentState) : WeeklyWeatherDisplay()
              ],
            ),
          );
  }
}
