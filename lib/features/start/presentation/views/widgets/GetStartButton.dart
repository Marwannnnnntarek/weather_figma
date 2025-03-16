import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
         context.go('/HomeView');
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: Size(144, 33),
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFF5c6ee5), // Button background color
        // padding: EdgeInsets.symmetric(horizontal: 31, vertical: 5), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ), // Rounded corners
      ),
      child: Text('Get Start', style: GoogleFonts.josefinSans(fontSize: 16)),
    );
  }
}
