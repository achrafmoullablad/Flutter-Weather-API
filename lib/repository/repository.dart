import 'package:weather_app/api/weathe_api_client.dart';
import 'package:weather_app/models/weather.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;
  WeatherRepository({required this.weatherApiClient});

  Future<List<Weather>> getWeather(String cityName) async {
    var weather = await weatherApiClient.getWeatherData(cityName);
    var weathers = await weatherApiClient.getForecast(cityName);
    weather.forecast = weathers;
    List<Weather> city = [weather];
    return city;
  }

  Future<List<Weather>> getFiveCity(String first, String second, String third,
      String fourth, String fifth) async {
    var weather = await weatherApiClient.getWeatherData(first);
    var weather2 = await weatherApiClient.getWeatherData(second);
    var weather3 = await weatherApiClient.getWeatherData(third);
    var weather4 = await weatherApiClient.getWeatherData(fourth);
    var weather5 = await weatherApiClient.getWeatherData(fifth);
    List<Weather> fiveCity = [weather, weather2, weather3, weather4, weather5];
    print(weather);
    return fiveCity;
  }
}
