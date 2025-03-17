import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      
      color: Color(0xFF4C4DDB),
      onPressed: () {
        context.pop();
      },
    );
  }
}
