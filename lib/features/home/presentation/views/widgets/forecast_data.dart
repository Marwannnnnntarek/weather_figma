import 'package:flutter/material.dart';
import 'package:myapp/features/home/data/models/weather/WeatherModel.dart' hide Text;
import 'package:myapp/features/home/presentation/views/widgets/forecast_listview.dart';
import 'package:myapp/features/home/presentation/views/widgets/forecast_text.dart';

class ForecastData extends StatelessWidget {
  const ForecastData({super.key, required this.weather});
final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ForecastText(),
        SizedBox(height: 49),
        ForecastListView(weather: weather,),
      ],
    );
  }
}

