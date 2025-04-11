import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/features/register/data/models/user_registration_data.dart';

/// Service class to handle authentication and user data operations
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Creates a new user account with email and password
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Saves user data to Firestore
  Future<void> saveUserData({
    required User user,
    required UserRegistrationData userData,
  }) async {
    await _firestore.collection('users').doc(user.uid).set({
      'name': userData.name,
      'email': userData.email,
      'phone': userData.phoneNumber,
      'country': userData.country,
      'createdAt': Timestamp.now(),
    });
  }

  /// Sends email verification to the user
  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }

  /// Gets the appropriate error message for FirebaseAuthException
  String getAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'invalid-email':
        return 'This email address is not valid.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'Registration failed. Please try again.';
    }
  }
}
