import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/home/manager/cubit/weatherCubit.dart';
import 'package:myapp/features/home/manager/cubit/weatherState.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/BackIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionsCard.dart';
import 'package:myapp/features/home/presentation/views/widgets/CustomPainter.dart';
import 'package:myapp/features/home/presentation/views/widgets/DateText.dart';
import 'package:myapp/features/home/presentation/views/widgets/ForecastData.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationIconImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationText.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/TemperatureGraphPainterRow.dart';
import 'package:myapp/features/home/presentation/views/widgets/WeatherCondition.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    // Fetch default city on screen load
    context.read<WeatherCubit>().fetchWeather("London");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final weather = state.weather;

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
                            ),
                            SizedBox(width: 75),
                            LocationIconImage(),
                            SizedBox(width: 7),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LocationText(weather: weather),
                                SizedBox(height: 9),
                                DateText(weather: weather),
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
        } else if (state is WeatherError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text("Search for a city"));
        }
      },
    );
  }
}
