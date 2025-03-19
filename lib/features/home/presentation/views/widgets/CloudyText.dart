import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CloudyText extends StatelessWidget {
  const CloudyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cloudy',
      style: GoogleFonts.josefinSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF5157EB),
      ),
    );
  }
}
