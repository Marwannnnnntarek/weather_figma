import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationPinButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreVertButton.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            MoreVertButton(),
            SizedBox(width: 75),
            LocationPinButton(),
            SizedBox(width: 5),
            LocationButton(),
            SizedBox(width: 78),
            AddCircleButton(),
          ],
        ),
      ],
    );
  }
}
