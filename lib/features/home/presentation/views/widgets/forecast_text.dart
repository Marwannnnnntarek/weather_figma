import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastText extends StatelessWidget {
  const ForecastText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 27, top: 20),
        child: Text(
          '3 Day Forecast ',
          style: GoogleFonts.josefinSans(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5157EB),
          ),
        ),
      ),
    );
  }
}
