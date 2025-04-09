import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/start/presentation/views/widgets/get_start_button.dart';

import 'package:myapp/features/start/presentation/views/widgets/start_image.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            StartImage(),
            SizedBox(height: 67),
            Text(
              'Weather',
              style: GoogleFonts.kavoon(fontSize: 36, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              'PyDjango',
              style: GoogleFonts.inter(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 42),
            GetStartButton(),
          ],
        ),
      ),
    );
  }
}
