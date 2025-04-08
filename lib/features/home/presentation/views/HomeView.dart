import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/HomeViewBody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: HomeViewBody(),
    ));
  }
}

