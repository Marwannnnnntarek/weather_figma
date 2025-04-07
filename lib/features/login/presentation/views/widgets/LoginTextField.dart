// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginTextField extends StatelessWidget {
//   const LoginTextField({super.key, required this.hint});
//  final String hint;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 212,
//       height: 43,
//       child: TextField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(30),
//           ),

//           filled: true,
//           fillColor: Color(0xFFcccde0),
//           hintText: hint,

//           hintStyle: GoogleFonts.inter(
//             fontSize: 10,
//             color: Color(0xFF6b6b76),
//             fontWeight: FontWeight.bold,
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 8,
//             horizontal: 15,
//           ), // Adjust vertical spacing
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key, required this.hint, required this.onChanged, this.validator,  this.obscureText = false});

  final String hint;
  final Function(String)? onChanged;
   final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 212,
          height: 43,
          child: TextFormField(
            validator: validator,
            obscureText: obscureText,
            textAlign: TextAlign.center,
            onChanged: onChanged,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              ),

              filled: true,
              fillColor: Color(0xFFcccde0),
              hintText: hint,

              hintStyle: GoogleFonts.inter(
                fontSize: 10,
                color: Color(0xFF6b6b76),
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ), // Adjust vertical spacing
            ),
          ),
        ),
      ],
    );
  }
}
