part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String cityName;

  FetchWeather({required this.cityName});
  List<Object> get props => [cityName];
}

class FetchFiveCityButtonClicked extends WeatherEvent {
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String fifth;

  FetchFiveCityButtonClicked(
      {this.first = "Mongolia",
      this.second = "London",
      this.third = "China",
      this.fourth = "Russia",
      this.fifth = "Sweden"});
  List<Object> get props => [fifth, fourth, third, second, first];
}
