import 'package:flutter/material.dart';

class MoreIconButton extends StatelessWidget {
  const MoreIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(Icons.more_vert_rounded, color: Color(0xFF656eef)),
    );
  }
}
