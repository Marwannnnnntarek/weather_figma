import 'package:flutter/material.dart';

class LocationPinButton extends StatelessWidget {
  const LocationPinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.location_pin, color: Color(0xFF3c3b99)),
      ),
    );
  }
}
