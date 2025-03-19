import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/CloudyText.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/TempText.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TempText()],
        ),
        Positioned(right: 72, top: 50, child: ConditionImage()),
        Positioned(left: 145, top: 132, child: CloudyText()),
      ],
    );
  }
}
