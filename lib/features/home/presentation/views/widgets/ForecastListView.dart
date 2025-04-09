import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/data/models/weather/WeatherModel.dart'
    hide Icon, Text;

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
            return SizedBox(
              width: 69,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color(0xFF4C4DDB),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    children: [
                      Text(
                        weather.forecast.forecastday[index].date.day.toString(),
                        style: GoogleFonts.josefinSans(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.sunny, color: Color(0xFFFEE265)),
                      Spacer(),
                      Text(
                        '19',
                        style: GoogleFonts.josefinSans(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '16',
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
          },
        ),
      ),
    );
  }
}
