import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFF5c6ee5), // Button background color
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 10,
        ), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
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