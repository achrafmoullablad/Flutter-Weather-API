import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/api_keys.dart';
import 'package:weather_app/api/weathe_api_client.dart';
import 'package:weather_app/repository/repository.dart';
import 'package:weather_app/repository/routes.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:http/http.dart' as http;
import 'bloc/weather_bloc.dart';
import 'bloc/weather_bloc_observre.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
      weatherApiClient: WeatherApiClient(
    httpClient: http.Client(),
    apiKey: ApiKeys.api_public,
  ));
  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: WeatherScreen(),
      ),
      routes: Routes.mainRoute,
    );
  }
}
