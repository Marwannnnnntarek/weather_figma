import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastListView extends StatelessWidget {
  const ForecastListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
    
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 69,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Color(0xFF4C4DDB),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  children: [
                    Text(
                      'Mon',
                      style: GoogleFonts.josefinSans(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.sunny, color: Color(0xFFFEE265)),
                    Spacer(),
                    Text(
                      '19',
                      style: GoogleFonts.josefinSans(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '16',
                      style: GoogleFonts.josefinSans(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
