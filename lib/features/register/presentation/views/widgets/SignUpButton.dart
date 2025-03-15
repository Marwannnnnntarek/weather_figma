import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFF5c6ee5), // Button background color
        padding: EdgeInsets.zero,
        fixedSize: Size(144, 33),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ), // Rounded corners
      ),
      child: Text(
        'Sign Up',
        style: GoogleFonts.josefinSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
