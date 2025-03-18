import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '1',
          style: GoogleFonts.josefinSans(
            fontSize: 128,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5157EB),
            shadows: [
              Shadow(
                blurRadius: 100, // Softness of the shadow
                color: Colors.black.withOpacity(0.8), // Shadow color
                offset: Offset(0, 4), // Changes position of shadow (X, Y)
              ),
            ],
          ),
        ),
        Text(
          '9',
          style: GoogleFonts.josefinSans(
            fontSize: 128,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5157EB),
            shadows: [
              Shadow(
                blurRadius: 100, // Softness of the shadow
                color: Colors.black.withOpacity(0.8), // Shadow color
                offset: Offset(0, 4), // Changes position of shadow (X, Y)
              ),
            ],
          ),
        ),
        Text(
          '°',
          style: GoogleFonts.josefinSans(
            fontSize: 128,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5157EB),
          ),
        ),
      ],
    );
  }
}
