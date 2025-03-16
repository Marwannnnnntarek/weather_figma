import 'package:flutter/material.dart';

class AddCircleButton extends StatelessWidget {
  const AddCircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_circle_outline, color: Color(0xFF656eef)),
      ),
    );
  }
}