part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> weathers;

  WeatherLoaded({required this.weathers});

  @override
  List<Object> get props => [WeatherState];
}

class WeatherError extends WeatherState {
  final int errorCode;

  WeatherError({required this.errorCode});

  @override
  List<Object> get props => [errorCode];
}
