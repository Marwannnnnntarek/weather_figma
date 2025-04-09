

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/services/apiServices.dart';
import 'package:myapp/features/home/manager/cubit/weatherState.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApiService weatherApiService;

  WeatherCubit(this.weatherApiService) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherApiService.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Failed to load weather: $e'));
    }
  }
}
