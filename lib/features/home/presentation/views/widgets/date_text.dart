import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/data/models/weather/weather_model.dart' hide Text;


class DateText extends StatelessWidget {
  const DateText({super.key, required this.weather});
final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Text(
       weather.location.localtime,
      style: GoogleFonts.josefinSans(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Color(0xFF8986EF),
      ),
    );
  }
}
