import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assetsData.dart';

class LocationIconImage extends StatelessWidget {
  const LocationIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.MapPin, height: 24, width: 24);
  }
}
