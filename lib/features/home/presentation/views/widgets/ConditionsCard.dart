import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/Humidity.dart';
import 'package:myapp/features/home/presentation/views/widgets/Precipitation.dart';
import 'package:myapp/features/home/presentation/views/widgets/Wind.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 72,
      child: Card(
        color: Color(0xFFE9E7FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
          child: Row(
            children: [Precipitation(), Spacer(), Humidity(), Spacer(), Wind()],
          ),
        ),
      ),
    );
  }
}
