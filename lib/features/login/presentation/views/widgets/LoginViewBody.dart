import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/login/presentation/views/widgets/CreateAnAccountButton.dart';
import 'package:myapp/features/login/presentation/views/widgets/LoginTextField.dart';
import 'package:myapp/features/login/presentation/views/widgets/SignInButton.dart';
import 'package:myapp/features/login/presentation/views/widgets/SignInText.dart';
import 'package:myapp/features/register/presentation/views/widgets/register_image.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool isLoading = false;

  void loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful!")));
      context.push('/HomeView');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
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
              SignInText(),

              LoginTextField(hint: 'Email', onChanged: (data) => email = data),
              const SizedBox(height: 27),

              LoginTextField(
                hint: 'Password',
                obscureText: true,
                onChanged: (data) => password = data,
              ),
              const SizedBox(height: 24),

              isLoading
                  ? const CircularProgressIndicator()
                  : SignInButton(onPressed: loginUser),

              CreateAnAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
