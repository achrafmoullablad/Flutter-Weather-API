import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';

class Routes {
  static final mainRoute = <String, WidgetBuilder>{
    '/home': (context) => WeatherScreen(),
    // '/settings': (context) => SettingsScreen(),
  };
}
