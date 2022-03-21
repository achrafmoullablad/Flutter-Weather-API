import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

import 'forecast_horizontal.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.weather.cityName.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 5,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 20),
          Text(
            this.weather.description.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 5,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            this.weather.temperature.celsius.round().toString() + "°",
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 5,
              fontWeight: FontWeight.w100,
            ),
          ),
          Padding(
            child: Divider(),
            padding: EdgeInsets.all(10),
          ),
          ForecastHorizontal(weathers: weather.forecast),
        ],
      ),
    );
  }
}
