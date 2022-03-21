import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

import 'forecast_horizontal.dart';

class FiveCity extends StatelessWidget {
  final Weather weather;

  FiveCity({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Padding(
            child: Divider(),
            padding: EdgeInsets.all(10),
          ),
          ForecastHorizontal(weathers: weather.forecast),
          Padding(
            child: Divider(),
            padding: EdgeInsets.all(10),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[]),
        ],
      ),
    );
  }
}
