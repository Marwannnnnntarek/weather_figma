import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/login/presentation/views/widgets/create_acc_button.dart';
import 'package:myapp/features/login/presentation/views/widgets/login_text_field.dart';
import 'package:myapp/features/login/presentation/views/widgets/signin_button.dart';
import 'package:myapp/features/login/presentation/views/widgets/signin_text.dart';
import 'package:myapp/features/register/presentation/views/widgets/register_image.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String? email, password;
  bool isLoading = false;

  void loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final user = userCredential.user;

      if (user != null) {
        if (!user.emailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please verify your email first.'),
              duration: Duration(seconds: 3),
            ),
          );
          await user.sendEmailVerification();
          setState(() => isLoading = false);
          return;
        }

        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login successful!")));
          context.push('/SearchView');
        }
      }
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
        case 'user-disabled':
          errorMessage = 'This account has been disabled.';
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
      if (mounted) {
        setState(() => isLoading = false);
      }
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

              LoginTextField(
                hint: 'Email',
                onChanged: (data) => email = data,
                // keyboardType: TextInputType.emailAddress,
              ),
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

              CreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
