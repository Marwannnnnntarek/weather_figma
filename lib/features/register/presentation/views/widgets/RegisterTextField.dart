import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 212,
      height: 43,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),

          filled: true,
          fillColor: Color(0xFFcccde0),
          hintText: hint,

          hintStyle: GoogleFonts.inter(
            fontSize: 10,
            color: Color(0xFF6b6b76),
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ), // Adjust vertical spacing
        ),
      ),
    );
  }
}
