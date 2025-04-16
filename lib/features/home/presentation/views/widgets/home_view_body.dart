import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/home/manager/cubit/weather_cubit.dart';
import 'package:myapp/features/home/manager/cubit/weather_state.dart';
import 'package:myapp/features/home/presentation/views/widgets/add_circle_button.dart';
import 'package:myapp/features/home/presentation/views/widgets/back_icon_button.dart';
import 'package:myapp/features/home/presentation/views/widgets/condition_card.dart';
import 'package:myapp/features/home/presentation/views/widgets/date_text.dart';
import 'package:myapp/features/home/presentation/views/widgets/forecast_data.dart';
import 'package:myapp/features/home/presentation/views/widgets/location_icon_image.dart';
import 'package:myapp/features/home/presentation/views/widgets/location_text.dart';
import 'package:myapp/features/home/presentation/views/widgets/more_icon_button.dart';
import 'package:myapp/features/home/presentation/views/widgets/weather_condition.dart';

class HomeViewBody extends StatefulWidget {
  final String cityName;

  const HomeViewBody({super.key, required this.cityName});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
                        padding: const EdgeInsets.only(top: 50, right: 20),
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
                            ),
                            Spacer(),
                            AddCircleButtonIcon(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      WeatherCondition(weather: weather),
                      SizedBox(height: 20),
                      ConditionsCard(weather: weather),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                ForecastData(weather: weather),
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
