import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A custom text field widget for registration form
class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
    this.isPhoneNumber = false,
  });

  final String hint;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool isPhoneNumber;

  /// Validates phone number format
  bool _isValidPhoneNumber(String phone) {
    // Allows numbers, +, -, and spaces
    // Minimum 8 characters
    final phoneRegex = RegExp(r'^[+]?[\d\s-]{8,}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validates the input based on field type
  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (isPhoneNumber && !_isValidPhoneNumber(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 212,
          height: 43,
          child: TextFormField(
            validator: _validateInput,
            obscureText: obscureText,
            textAlign: TextAlign.center,
            onChanged: onChanged,
            keyboardType:
                isPhoneNumber ? TextInputType.phone : TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: const Color(0xFFcccde0),
              hintText: hint,
              errorStyle: const TextStyle(height: 0.1),
              hintStyle: GoogleFonts.inter(
                fontSize: 10,
                color: const Color(0xFF6b6b76),
                fontWeight: FontWeight.bold,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
