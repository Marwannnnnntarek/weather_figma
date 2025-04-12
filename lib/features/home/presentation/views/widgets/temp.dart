import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

   
import 'package:myapp/features/home/data/models/weather/weather_model.dart' hide Text;

class Temp extends StatelessWidget {
  const Temp({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${weather.current.tempC.toStringAsFixed(0)}°",
      style: GoogleFonts.josefinSans(
        fontSize: 128,
        fontWeight: FontWeight.w500,
        color: Color(0xFF5157EB),
      ),
    );
  }
}
