import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationView extends StatefulWidget {
  final User user;
  const VerificationView({super.key, required this.user});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  bool _isResending = false;
  bool _isChecking = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _checkEmailVerification() async {
    setState(() => _isChecking = true);

    try {
      await widget.user.reload();
      if (widget.user.emailVerified) {
        if (mounted) {
          _showSnackBar('Email verified successfully!');
          context.push('/SearchView');
        }
      } else {
        _showSnackBar('Email not verified yet. Please check your inbox.');
      }
    } catch (e) {
      _showSnackBar('An error occurred while checking verification status.');
    } finally {
      if (mounted) {
        setState(() => _isChecking = false);
      }
    }
  }

  Future<void> _resendVerification() async {
    setState(() => _isResending = true);

    try {
      await widget.user.sendEmailVerification();
      _showSnackBar('Verification email sent. Please check your inbox.');
    } catch (e) {
      _showSnackBar('Failed to resend verification email.');
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF99a0fa),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Email Verification',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'We have sent a verification link to your email address. Please check your inbox and click the link to verify your account.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _isChecking
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _checkEmailVerification,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5c6ee5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text('Check Verification Status'),
                      ),
                const SizedBox(height: 20),
                _isResending
                    ? const CircularProgressIndicator()
                    : TextButton(
                        onPressed: _resendVerification,
                        child: Text(
                          'Resend Verification Email',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
