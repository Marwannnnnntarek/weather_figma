import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/home/presentation/views/widgets/ForecastListView.dart';

class ForecastData extends StatelessWidget {
  const ForecastData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 27, top: 39),
            child: Text(
              '7 Day Forecast ',
              style: GoogleFonts.josefinSans(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5157EB),
              ),
            ),
          ),
        ),
        SizedBox(height: 49),
        ForecastListView(),
      ],
    );
  }
}

