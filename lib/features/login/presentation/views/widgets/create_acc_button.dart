import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 255),
      child: TextButton(
        onPressed: () {
          context.push('/RegisterView');
        },

        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: Colors.black, // Text color
        ),
        child: Text(
          'Create an account',
          style: GoogleFonts.josefinSans(fontSize: 9),
        ),
      ),
    );
  }
}
