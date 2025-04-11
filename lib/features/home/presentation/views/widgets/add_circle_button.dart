import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCircleButtonIcon extends StatelessWidget {
  const AddCircleButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add_circle_outline),
      color: Color(0xFF656eef),
      iconSize: 30.0,
      onPressed: () {
        context.push('/SearchView');
      },
    );
    // Icon(Icons.add_circle_outline, color: Color(0xFF656eef));
  }
}
