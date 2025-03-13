import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/start/presentation/views/widgets/CreateAnAccountButton.dart';
import 'package:myapp/features/start/presentation/views/widgets/GetStartButton.dart';

import 'package:myapp/features/start/presentation/views/widgets/startImage.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StartImage(),
          SizedBox(height: 40),
          Text(
            'Weather',
            style: GoogleFonts.kavoon(fontSize: 36, color: Colors.white),
          ),
          Text(
            'PyDjango',
            style: GoogleFonts.inter(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 40),
          GetStartButton(),
          CreateAnAccountButton(),
        ],
      ),
    );
  }
}






