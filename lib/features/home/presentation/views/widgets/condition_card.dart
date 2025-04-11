import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/models/weather/WeatherModel.dart'
    hide Text;
import 'package:myapp/features/home/presentation/views/widgets/humidity.dart';

import 'package:myapp/features/home/presentation/views/widgets/precipitation.dart';
import 'package:myapp/features/home/presentation/views/widgets/wind.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 72,
      child: Card(
        color: Color(0xFFE9E7FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
          child: Row(
            children: [
              Precipitation(weather: weather,),
              Spacer(),
              Humidity(weather: weather),
              Spacer(),
              Wind(weather: weather),
            ],
          ),
        ),
      ),
    );
  }
}
