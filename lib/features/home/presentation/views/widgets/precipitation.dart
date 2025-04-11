import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/helpers/assets_data.dart';
import 'package:myapp/features/home/data/models/weather/weather_model.dart'
    hide Text;

class PrecipitationWidget extends StatelessWidget {
  const PrecipitationWidget({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsData.umbrella, width: 24, height: 24),
        Text(
          "${weather.current.precipMm}mm",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
