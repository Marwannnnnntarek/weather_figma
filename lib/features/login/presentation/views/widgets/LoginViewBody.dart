import 'package:flutter/material.dart';
import 'package:myapp/features/login/presentation/views/widgets/LoginTextField.dart';
import 'package:myapp/features/login/presentation/views/widgets/SignInButton.dart';
import 'package:myapp/features/login/presentation/views/widgets/SignInText.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterImage.dart';
import 'package:myapp/features/login/presentation/views/widgets/CreateAnAccountButton.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegisterImage(),
            SignInText(),
            LoginTextField(hint: 'Email'),
            SizedBox(height: 27),
            LoginTextField(hint: 'Password'),
            SizedBox(height: 24),
            SignInButton(),
            CreateAnAccountButton(),
          ],
        ),
      ),
    );
  }
}