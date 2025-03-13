import 'package:flutter/material.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterViewBody.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF99a0fa),
        body: RegisterViewBody(),
      ),
    );
  }
}
