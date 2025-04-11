import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/home/manager/cubit/weather_cubit.dart';
import 'package:myapp/features/home/manager/cubit/weather_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF99a0fa),
        appBar: AppBar(
          title: const Text('Search City'),
          backgroundColor: Color(0xFF99a0fa),
        ),
        body: BlocListener<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'City not found. Please try again with a valid city name.',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 3),
                ),
              );
            } else if (state is WeatherLoaded) {
              context.go('/HomeView');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onSubmitted: (String city) {
                    if (city.isNotEmpty) {
                      context.read<WeatherCubit>().fetchWeather(city);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
