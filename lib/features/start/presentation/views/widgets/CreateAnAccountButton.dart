import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAnAccountButton extends StatelessWidget {
  const CreateAnAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/RegisterView');
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Text color
      ),
      child: Text(
        'Create an account',
        style: GoogleFonts.josefinSans(fontSize: 9),
      ),
    );
  }
}