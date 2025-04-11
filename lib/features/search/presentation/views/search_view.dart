import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/home/manager/cubit/weather_cubit.dart';

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
        body: Padding(
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
                    context.go('/HomeView');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
