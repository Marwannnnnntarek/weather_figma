import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assetsData.dart';
import 'package:myapp/features/home/presentation/views/widgets/AddCircleIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/BackIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/Cloudy.dart';
import 'package:myapp/features/home/presentation/views/widgets/ConditionImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/Date.dart';
import 'package:myapp/features/home/presentation/views/widgets/Location.dart';
import 'package:myapp/features/home/presentation/views/widgets/LocationIconImage.dart';
import 'package:myapp/features/home/presentation/views/widgets/MoreIconButton.dart';
import 'package:myapp/features/home/presentation/views/widgets/Temp.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(children: [MoreIconButton(), BackIconButton()]),
            SizedBox(width: 75),
            LocationIconImage(),
            SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Location(), Date()],
            ),
            Spacer(),
            AddCircleButtonIcon(),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Aligns Temp() to bottom
                  children: [Temp()],
                ),
                Positioned(right: 72, top: 50, child: ConditionImage()),
                Positioned(left: 145, top: 132, child: Cloudy()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
