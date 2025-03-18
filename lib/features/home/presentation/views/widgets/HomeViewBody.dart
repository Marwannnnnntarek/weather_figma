import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/BackIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionsCard.dart';
import 'package:myapp/features/home/presentation/views/widgets/Date.dart';
import 'package:myapp/features/home/presentation/views/widgets/ForecastData.dart';
import 'package:myapp/features/home/presentation/views/widgets/Location.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationIconImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/WeatherCondition.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 400,
            color: Color(0xFFD9D9D9),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [MoreIconButton(), BackIconButton()]),
                      SizedBox(width: 75),
                      LocationIconImage(),
                      SizedBox(width: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Location(), Date()],
                      ),
                      Spacer(),
                      AddCircleButtonIcon(),
                    ],
                  ),
                  WeatherCondition(),
                  ConditionsCard(),
                  // ForecastContainer(),
                ],
              ),
            ),
          ),
          ForecastData(),
        ],
      ),
    );
  }
}
