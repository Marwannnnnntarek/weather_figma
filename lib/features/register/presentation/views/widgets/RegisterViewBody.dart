import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterImage.dart';
import 'package:myapp/features/register/presentation/views/widgets/RegisterTextField.dart';
import 'package:myapp/features/register/presentation/views/widgets/SignUpButton.dart';
import 'package:myapp/features/register/presentation/views/widgets/SignUpText.dart';
import 'package:myapp/features/register/presentation/views/widgets/WithoutSignUpButton.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool isLoading = false;

  void registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      await userCredential.user?.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Registration successful. Check your email for verification.",
          ),
        ),
      );

      context.push('/HomeView');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'This email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'Registration failed. Please try again.';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('An error occurred.')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegisterImage(),
              SignUpText(),

              RegisterTextField(
                hint: 'Email',
                onChanged: (data) => email = data,
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 27),

              RegisterTextField(
                hint: 'Password',
                // obscureText: true,
                onChanged: (data) => password = data,
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              isLoading
                  ? const CircularProgressIndicator()
                  : SignUpButton(onPressed: registerUser),

              WithoutSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
