import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/features/home/data/models/weather/weather_model.dart' hide Text;

class LocationText extends StatelessWidget {
  const LocationText({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Text(
      weather.location.name,
      style: GoogleFonts.josefinSans(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3c3b99),
      ),
    );
  }
}
