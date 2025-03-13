import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterTextField.dart';
import 'package:myapp/features/register/presentation/views/widgets/SignUpButton.dart';
import 'package:myapp/features/register/presentation/views/widgets/WithoutSignUpButton.dart';

import 'package:myapp/features/start/presentation/views/widgets/startImage.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StartImage(),
            SizedBox(height: 40),
            Text(
              'Sign Up Now!',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            RegisterTextField(hint: 'First name and last name'),
            SizedBox(height: 20),
            RegisterTextField(hint: 'Email'),
            SizedBox(height: 20),
            RegisterTextField(hint: 'Phone Number'),
            SizedBox(height: 20),
            RegisterTextField(hint: 'Country'),
            SizedBox(height: 20),
            RegisterTextField(hint: 'Password'),
            SizedBox(height: 20),
            SignUpButton(email: 'marwan@gmail.com', password: 'kjgaskjgfjkaf',),
            WithoutSignUpButton(),
          ],
        ),
      ),
    );
  }
}

