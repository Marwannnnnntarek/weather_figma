import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/helpers/app_routes.dart' as AppRouters;
import 'package:myapp/core/services/apiServices.dart';
import 'package:myapp/features/home/manager/cubit/weather_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( BlocProvider(
       create: (context) => WeatherCubit(WeatherApiService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
