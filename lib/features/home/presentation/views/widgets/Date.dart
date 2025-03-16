import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Date extends StatelessWidget {
  const Date({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 208,
      child: Center(
        child: Text(
          'Monday, 3 October 9:00',
          style: GoogleFonts.josefinSans(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xFF8986EF),
          ),
        ),
      ),
    );
  }
}