import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/api/http_exception.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherEmpty());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final List<Weather> weathers =
            await weatherRepository.getWeather(event.cityName);
        yield WeatherLoaded(weathers: weathers);
      } catch (exception) {
        print(exception);
        if (exception is HTTPException) {
          yield WeatherError(errorCode: exception.code);
        } else {
          yield WeatherError(errorCode: 500);
        }
      }
    } else if (event is FetchFiveCityButtonClicked) {
      yield WeatherLoading();
      print("5city Clicked");
      try {
        final List<Weather> weathers = await weatherRepository.getFiveCity(
            "Mongolia", "Russia", "China", "Sweden", "England");
        print('!@#@!#!@#!#!#!');
        print(weathers);
        yield WeatherLoaded(weathers: weathers);
      } catch (exception) {
        print(exception);
        if (exception is HTTPException) {
          yield WeatherError(errorCode: exception.code);
        } else {
          yield WeatherError(errorCode: 500);
        }
      }
    }
  }
}
