import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFF5c6ee5), // Button background color
        padding: EdgeInsets.symmetric(horizontal: 31, vertical: 8), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ), // Rounded corners
      ),
      child: Text('Get Start', style: GoogleFonts.josefinSans(fontSize: 16)),
    );
  }
}
