import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/BackIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/Date.dart';
import 'package:myapp/features/home/presentation/views/widgets/Location.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationIconImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreIconButton.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              MoreIconButton(),
              SizedBox(width: 75),
              LocationIconImage(),
              SizedBox(width: 15),
              Location(),
              SizedBox(width: 70),
              AddCircleButtonIcon(),
            ],
          ),
          Row(children: [BackIconButton(), SizedBox(width: 46), Date()]),
        ],
      ),
    );
  }
}
