import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/data/models/weather/WeatherModel.dart'
    hide Icon, Text;

class Wind extends StatelessWidget {
  const Wind({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(FontAwesomeIcons.wind, color: Color(0xFF4C4DDB)),
        Text(
          weather.forecast.forecastday[0].hour[0].windKph.toString(),
          style: GoogleFonts.josefinSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
        Text(
          'Wind Speed',
          style: GoogleFonts.josefinSans(
            fontSize: 6,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
      ],
    );
  }
}
