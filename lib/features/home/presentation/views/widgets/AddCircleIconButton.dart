import 'package:flutter/material.dart';

class AddCircleButtonIcon extends StatelessWidget {
  const AddCircleButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(Icons.add_circle_outline, color: Color(0xFF656eef)),
      ),
    );
  }
}
