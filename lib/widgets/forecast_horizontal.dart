import 'package:flutter/material.dart';

import 'package:weather_app/models/weather.dart';

class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    required this.weathers,
  });

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.weathers.length,
        separatorBuilder: (context, index) => Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Column(
                children: [
                  Text(DateTime.fromMillisecondsSinceEpoch(item.time * 1000)
                      .toString()),
                  Text('${item.temperature.celsius.round()}°'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
