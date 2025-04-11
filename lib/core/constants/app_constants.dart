import 'package:flutter/material.dart';

/// App-wide constants
class AppConstants {
  // Colors
  static const Color primaryColor = Color(0xFF99a0fa);
  static const Color secondaryColor = Color(0xFF5c6ee5);
  static const Color textFieldColor = Color(0xFFcccde0);
  static const Color textColor = Color(0xFF6b6b76);
  static const Color darkTextColor = Color(0xFF3c3b99);

  // Text styles
  static const double smallFontSize = 10;
  static const double mediumFontSize = 16;
  static const double largeFontSize = 24;

  // Spacing
  static const double smallSpacing = 8;
  static const double mediumSpacing = 16;
  static const double largeSpacing = 24;
  static const double extraLargeSpacing = 27;

  // Error messages
  static const String requiredFieldError = 'This field is required';
  static const String invalidPhoneError = 'Please enter a valid phone number';
  static const String registrationSuccess =
      'Registration successful. Check your email for verification.';
  static const String genericError = 'An error occurred. Please try again.';
  static const String emailInUseError = 'This email is already in use.';
  static const String invalidEmailError = 'This email address is not valid.';
  static const String weakPasswordError = 'The password is too weak.';
  static const String registrationFailedError =
      'Registration failed. Please try again.';
}
