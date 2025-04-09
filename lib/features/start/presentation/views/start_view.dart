import 'package:flutter/material.dart';
import 'package:myapp/features/start/presentation/views/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF99a0fa),
        body: StartViewBody(),
      ),
    );
  }
}
