import 'package:flutter/material.dart';

class MoreVertButton extends StatelessWidget {
  const MoreVertButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert, color: Color(0xFF656eef)),
      ),
    );
  }
}