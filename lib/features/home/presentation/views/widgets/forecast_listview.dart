import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/data/models/weather/weather_model.dart'
    hide Text, Icon;

class ForecastListView extends StatelessWidget {
  const ForecastListView({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 68, left: 12),
      child: SizedBox(
        height: 104,
        child: ListView.builder(
          itemCount: weather.forecast.forecastday.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final day = weather.forecast.forecastday[index];
            return _forecastTile(
              day.date,
              day.day.maxtempC.toStringAsFixed(0),
              day.day.mintempC.toStringAsFixed(0),
              day.day.condition.text,
            );
          },
        ),
      ),
    );
  }

  Widget _forecastTile(
    DateTime date,
    String max,
    String min,
    String condition,
  ) {
    return SizedBox(
      width: 69,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Color(0xFF4C4DDB),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: [
              Text(
                _dayName(date),

                style: GoogleFonts.josefinSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.sunny, color: Color(0xFFFEE265)),

              Spacer(),
              Text(
                max,
                style: GoogleFonts.josefinSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                min,
                style: GoogleFonts.josefinSans(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _dayName(DateTime date) {
    return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][date.weekday - 1];
  }
}
