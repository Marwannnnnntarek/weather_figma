import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class Humidity extends StatelessWidget {
  const Humidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsData.Droplet),
        Text(
          '20%',
          style: GoogleFonts.josefinSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
        Text(
          'Humidity',
          style: GoogleFonts.josefinSans(
            fontSize: 6,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
      ],
    );
  }
}
