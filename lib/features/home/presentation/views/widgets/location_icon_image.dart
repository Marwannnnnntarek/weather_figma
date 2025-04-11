import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/assets_data.dart';

class LocationIconImage extends StatelessWidget {
  const LocationIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.mapPin, width: 24, height: 24);
  }
}
