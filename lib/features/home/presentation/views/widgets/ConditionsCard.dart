import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 69,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Precipitation(),
              Spacer(),
              Humidity(),
              Spacer(),
              Wind(),
            ],
          ),
        ),
      ),
    );
  }
}

class Wind extends StatelessWidget {
  const Wind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(FontAwesomeIcons.wind, color: Color(0xFF4C4DDB)),
        Text(
          '12km/h',
          style: GoogleFonts.josefinSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
        Text(
          'Wind Speed',
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

class Humidity extends StatelessWidget {
  const Humidity({
    super.key,
  });

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

class Precipitation extends StatelessWidget {
  const Precipitation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsData.Umbrella),
        Text(
          '30%',
          style: GoogleFonts.josefinSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4DDB),
          ),
        ),
        Text(
          'Precipitation',
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
