import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureGraphPainterRow extends StatelessWidget {
  const TemperatureGraphPainterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '00:00',
            style: GoogleFonts.josefinSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF656EEF),
            ),
          ),
          Spacer(),
          Text(
            '6:00',
            style: GoogleFonts.josefinSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF656EEF),
            ),
          ),
          Spacer(),
          Text(
            '10:00',
            style: GoogleFonts.josefinSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF656EEF),
            ),
          ),
          Spacer(),
          Text(
            '12:00',
            style: GoogleFonts.josefinSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF656EEF),
            ),
          ),
          Spacer(),
          Text(
            '15:00',
            style: GoogleFonts.josefinSans(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF656EEF),
            ),
          ),
        ],
      ),
    );
  }
}
