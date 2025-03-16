import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: SizedBox(
        height: 24,
        width: 24,
        child: BackButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
          ),
          color: Color(0xFF4C4DDB),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
