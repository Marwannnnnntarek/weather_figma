import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TempText extends StatelessWidget {
  const TempText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '19°',
      style: GoogleFonts.josefinSans(
        fontSize: 128,
        fontWeight: FontWeight.w500,
        color: Color(0xFF5157EB),
      ),
    );
  }
}
