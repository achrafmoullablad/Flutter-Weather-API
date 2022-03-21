import 'package:weather_app/utils/convertors.dart';

class Weather {
  int time;
  String description;
  String main;
  String cityName;
  Temperature temperature;
  List<Weather> forecast;

  Weather(
      {required this.time,
      required this.description,
      required this.main,
      required this.cityName,
      required this.temperature,
      required this.forecast});

  static Weather fromJson(Map<String, dynamic> json) {
    // fromJson
    print(json);
    final weather = json['weather'][0];
    return Weather(
      time: json['dt'],
      description: weather['description'],
      main: weather['main'],
      cityName: json['name'],
      temperature: Temperature(intToDouble(json['main']['temp'])),
      forecast: [],
    );
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = <Weather>[];
    for (final item in json['list']) {
      weathers.add(Weather(
        time: item['dt'],
        temperature: Temperature(intToDouble(
          item['main']['temp'],
        )),
        cityName: '',
        description: '',
        forecast: [],
        main: '',
      ));
    }
    return weathers;
  }
}
