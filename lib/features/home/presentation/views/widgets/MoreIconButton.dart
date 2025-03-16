import 'package:flutter/material.dart';

class MoreIconButton extends StatelessWidget {
  const MoreIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(Icons.more_vert_rounded, color: Color(0xFF656eef)),
      ),
    );
  }
}
