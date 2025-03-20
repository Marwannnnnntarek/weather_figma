// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RegisterTextField extends StatefulWidget {
//   const RegisterTextField({super.key});
//   // final String hint;

//   @override
//   State<RegisterTextField> createState() => _RegisterTextFieldState();
// }

// class _RegisterTextFieldState extends State<RegisterTextField> {
//   final _auth = FirebaseAuth.instance;
//   String? email;
//   String? password;
//   bool showSpinner = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: 212,
//           height: 43,
//           child: TextField(
//             keyboardType: TextInputType.emailAddress,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               email = value;
//               //Do something with the user input.
//             },
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(30),
//               ),

//               filled: true,
//               fillColor: Color(0xFFcccde0),
//               hintText: 'Enter your email',

//               hintStyle: GoogleFonts.inter(
//                 fontSize: 10,
//                 color: Color(0xFF6b6b76),
//                 fontWeight: FontWeight.bold,
//               ),
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 8,
//                 horizontal: 15,
//               ), // Adjust vertical spacing
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 212,
//           height: 43,
//           child: TextField(
//             obscureText: true,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               password = value;
//               //Do something with the user input.
//             },
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(30),
//               ),

//               filled: true,
//               fillColor: Color(0xFFcccde0),
//               hintText: 'Enter your Password',

//               hintStyle: GoogleFonts.inter(
//                 fontSize: 10,
//                 color: Color(0xFF6b6b76),
//                 fontWeight: FontWeight.bold,
//               ),
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 8,
//                 horizontal: 15,
//               ), // Adjust vertical spacing
//             ),
//           ),
//         ),

//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Password',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );

                    context.push('/HomeView');
                                    } catch (e) {
                    print(e);
                  }

                  setState(() {
                    showSpinner = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded edges
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ), // Button padding
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
