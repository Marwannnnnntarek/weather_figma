import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 119,
      child: Text(
        'Location',
        style: GoogleFonts.josefinSans(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3c3b99),
        ),
      ),
    );
  }
}
