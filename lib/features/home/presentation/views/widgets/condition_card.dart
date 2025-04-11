import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/models/weather/weather_model.dart';
import 'package:myapp/features/home/presentation/views/widgets/humidity.dart';
import 'package:myapp/features/home/presentation/views/widgets/precipitation.dart';
import 'package:myapp/features/home/presentation/views/widgets/wind.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PrecipitationWidget(weather: weather),
          HumidityWidget(weather: weather),
          WindWidget(weather: weather),
        ],
      ),
    );
  }
}
