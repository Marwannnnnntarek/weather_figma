import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/data/models/weather/WeatherModel.dart'
    hide Text;
import 'package:myapp/features/home/presentation/views/widgets/TempText.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TempText()],
        ),
        Positioned(
          right: 72,
          top: 50,
          child: Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(weather.current.condition.icon.name),
              ),
            ),
          ),
        ),
        Positioned(
          left: 145,
          top: 132,
          child: Text(
            weather.current.condition.text.name,
            style: GoogleFonts.josefinSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5157EB),
            ),
          ),
        ),
      ],
    );
  }
}
