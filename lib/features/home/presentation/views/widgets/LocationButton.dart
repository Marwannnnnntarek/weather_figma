import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Color(0xFF3c3b99), // Text color
        ),
        child: Text(
          'Location',
          style: GoogleFonts.josefinSans(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
