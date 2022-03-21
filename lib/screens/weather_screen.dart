import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc _weatherBloc;
  String _cityName = 'Mongolia';
  @override
  void initState() {
    super.initState();
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Column(
        children: [
          BlocBuilder<WeatherBloc, WeatherState>(
              builder: (_, WeatherState weatherState) {
            if (weatherState is WeatherLoaded) {
              return Container(
                height: 600,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: weatherState.weathers.length,
                    itemBuilder: (context, index) => Container(
                          height: 200,
                          width: double.infinity,
                          child: WeatherWidget(
                            weather: weatherState.weathers[index],
                          ),
                        )),
              );
            } else if (weatherState is WeatherError ||
                weatherState is WeatherEmpty) {
              String errorText = 'There was an error fetching weather data';
              if (weatherState is WeatherError) {
                if (weatherState.errorCode == 404) {
                  errorText = 'We have trouble fetching weather for $_cityName';
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 24,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    errorText,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 1,
                    ),
                    child: Text("Try Again"),
                    onPressed: _fetchWeatherWithCity,
                  )
                ],
              );
            } else if (weatherState is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: Text('No city set'),
            );
          }),
          ElevatedButton(
              child: Text('5 cities'),
              onPressed: () {
                _weatherBloc.add(
                  FetchFiveCityButtonClicked(
                      fourth: "Russia",
                      fifth: "Mongolia",
                      second: "Sweden",
                      first: "China",
                      third: "English"),
                );
              }),
        ],
      ),
    );
  }

  _fetchWeatherWithCity() async {
    _weatherBloc.add(FetchWeather(cityName: _cityName));
  }
}
