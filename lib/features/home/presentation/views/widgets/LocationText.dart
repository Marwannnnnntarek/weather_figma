import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationText extends StatelessWidget {
  const LocationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Location',
      style: GoogleFonts.josefinSans(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3c3b99),
      ),
    );
  }
}
