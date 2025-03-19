import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class LocationIconImage extends StatelessWidget {
  const LocationIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Image.asset(AssetsData.MapPin),
    );
  }
}
