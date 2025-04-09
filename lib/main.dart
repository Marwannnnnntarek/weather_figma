import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/services/apiServices.dart';
import 'package:myapp/core/helpers/appRouters.dart';
import 'package:myapp/features/home/manager/cubit/weatherCubit.dart';


 main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  BlocProvider(
    create: (context) => WeatherCubit(WeatherApiService()),
    child: const MyApp(),
  ),
);

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp.router(
      routerConfig: AppRouters.router,
      debugShowCheckedModeBanner: false,
    );
    // MaterialApp(home: Scaffold(body: Container(color: Colors.red)));
  }
}
