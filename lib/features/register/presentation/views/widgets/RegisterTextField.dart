import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({super.key, required this.hint});
  final String hint;

  @override
  State<RegisterTextField> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 212,
          height: 43,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              email = value;
              //Do something with the user input.
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),

              filled: true,
              fillColor: Color(0xFFcccde0),
              hintText: widget.hint,

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
        ),
        
      ],
    );
  }
}
