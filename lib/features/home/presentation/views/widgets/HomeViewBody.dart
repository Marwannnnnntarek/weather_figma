import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/BackIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionsCard.dart';
import 'package:myapp/features/home/presentation/views/widgets/CustomPainter.dart';
import 'package:myapp/features/home/presentation/views/widgets/DateText.dart';
import 'package:myapp/features/home/presentation/views/widgets/ForecastData.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationText.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationIconImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/TemperatureGraphPainterRow.dart';
import 'package:myapp/features/home/presentation/views/widgets/WeatherCondition.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color(0xFFD9D9D9),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [MoreIconButton(), BackIconButton()],
                      ), //col1
                      SizedBox(width: 75),
                      LocationIconImage(),
                      SizedBox(width: 7),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LocationText(),
                          SizedBox(height: 9),
                          DateText(),
                        ],
                      ), //col2
                      Spacer(),
                      AddCircleButtonIcon(),
                    ],
                  ),
                ),
                WeatherCondition(),
                ConditionsCard(),
                SizedBox(height: 31),
                SizedBox(
                  height: 48,
                  width: 390,
                  child: CustomPaint(
                    size: Size(300, 150), // Adjust size
                    painter: TemperatureGraphPainter(),
                  ),
                ),
                TemperatureGraphPainterRow(),
                SizedBox(height: 138),
              ],
            ),
          ),
          ForecastData(),
        ],
      ),
    );
  }
}
