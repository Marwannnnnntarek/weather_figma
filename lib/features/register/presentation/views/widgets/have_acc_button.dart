import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HaveAccButton extends StatelessWidget {
  const HaveAccButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 76),
      child: TextButton(
        onPressed: () {
          context.push('/LoginView');
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black, // Text color
        ),
        child: Text(
          'Already have an account',
          style: GoogleFonts.josefinSans(
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
