import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/Cloudy.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/Temp.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns Temp() to bottom
              children: [Temp()],
            ),
            Positioned(right: 72, top: 50, child: ConditionImage()),
            Positioned(left: 145, top: 132, child: Cloudy()),
          ],
        ),
      ],
    );
  }
}
