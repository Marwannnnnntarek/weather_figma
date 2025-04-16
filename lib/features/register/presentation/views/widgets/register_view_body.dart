import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/register/data/models/user_registration_data.dart';
import 'package:myapp/features/register/data/services/auth_service.dart';
import 'package:myapp/features/register/presentation/views/widgets/register_image.dart';
import 'package:myapp/features/register/presentation/views/widgets/register_text_field.dart';
import 'package:myapp/features/register/presentation/views/widgets/sign_up_button.dart';
import 'package:myapp/features/register/presentation/views/widgets/sign_up_text.dart';
import 'package:myapp/features/register/presentation/views/widgets/have_acc_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final _userData = UserRegistrationData(
    name: '',
    email: '',
    phoneNumber: '',
    country: '',
    password: '',
  );
  bool _isLoading = false;

  /// Shows a snackbar with the given message
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Handles the registration process
  Future<void> _handleRegistration() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userCredential = await _authService.createUserWithEmailAndPassword(
        email: _userData.email,
        password: _userData.password,
      );

      final user = userCredential.user;
      if (user != null) {
        await _authService.saveUserData(user: user, userData: _userData);
        await _authService.sendEmailVerification(user);

        if (mounted) {
          context.push(
            '/VerificationScreen',
            extra: {'email': _userData.email, 'password': _userData.password},
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      _showSnackBar(_authService.getAuthErrorMessage(e));
    } catch (e) {
      _showSnackBar('An error occurred. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
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
              const RegisterImage(),
              const SignUpText(),
              RegisterTextField(
                hint: 'First name and last name',
                onChanged: (data) => _userData.name = data,
              ),
              const SizedBox(height: 27),
              RegisterTextField(
                hint: 'Email',
                onChanged: (data) => _userData.email = data,
              ),
              const SizedBox(height: 27),
              RegisterTextField(
                hint: 'Phone Number',
                onChanged: (data) => _userData.phoneNumber = data,
                isPhoneNumber: true,
              ),
              const SizedBox(height: 27),
              RegisterTextField(
                hint: 'Country',
                onChanged: (data) => _userData.country = data,
              ),
              const SizedBox(height: 27),
              RegisterTextField(
                hint: 'Password',
                obscureText: true,
                onChanged: (data) => _userData.password = data,
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SignUpButton(onPressed: _handleRegistration),
              const HaveAccButton(),
            ],
          ),
        ),
      ),
    );
  }
}
