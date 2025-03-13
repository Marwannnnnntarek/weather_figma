import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.email, required this.password});

  final String email, password;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          print("User registered: ${userCredential.user?.email}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User registered successfully!')),
          );
        } catch (e) {
          print("Error: $e");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFF5c6ee5), // Button background color
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Padding
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
