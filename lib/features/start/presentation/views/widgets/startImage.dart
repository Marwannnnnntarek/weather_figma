import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class StartImage extends StatelessWidget {
  const StartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140),
      child: Container(
        height: 193,
        width: 201,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.logo),
          ),
        ),
      ),
    );
  }
}
