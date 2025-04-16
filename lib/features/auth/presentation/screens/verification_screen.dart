import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/auth/manager/cubit/auth_cubit.dart';
import 'package:myapp/features/auth/manager/states/auth_states.dart';

class VerificationScreen extends StatelessWidget {
  final String email;
  final String password;

  const VerificationScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthVerifiedState) {
          context.push('/HomeView');
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is AuthVerificationSentState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Verification email sent successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Email Verification')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please check your email for verification',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'We have sent a verification email to:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                if (state is AuthLoadingState)
                  const CircularProgressIndicator()
                else ...[
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().sendVerificationEmail();
                    },
                    child: const Text('Resend Verification Email'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().checkEmailVerification();
                    },
                    child: const Text('I have verified my email'),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
