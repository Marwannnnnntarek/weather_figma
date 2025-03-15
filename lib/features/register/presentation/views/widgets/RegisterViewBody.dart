import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterImage.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterTextField.dart';
import 'package:myapp/features/register/presentation/views/widgets/SignUpButton.dart';
import 'package:myapp/features/register/presentation/views/widgets/WithoutSignUpButton.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegisterImage(),
            Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: Text(
                'Sign Up Now!',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            RegisterTextField(hint: 'First name and last name'),
            SizedBox(height: 26),
            RegisterTextField(hint: 'Email'),
            SizedBox(height: 27),
            RegisterTextField(hint: 'Phone Number'),
            SizedBox(height: 26),
            RegisterTextField(hint: 'Country'),
            SizedBox(height: 23),
            RegisterTextField(hint: 'Password'),
            SizedBox(height: 24),
            SignUpButton(),
            WithoutSignUpButton(),
          ],
        ),
      ),
    );
  }
}
