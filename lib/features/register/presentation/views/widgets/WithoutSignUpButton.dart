import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WithoutSignUpButton extends StatelessWidget {
  const WithoutSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Text color
      ),
      child: Text(
        'Continue without sign up',
        style: GoogleFonts.josefinSans(
          fontSize: 9,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
