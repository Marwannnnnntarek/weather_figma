import 'package:flutter/material.dart';
import 'package:myapp/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF99a0fa),
        body: LoginViewBody(),
      ),
    );
  }
}
