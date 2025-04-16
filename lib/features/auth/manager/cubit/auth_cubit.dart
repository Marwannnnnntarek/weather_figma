import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/auth/manager/states/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitialState());

  Future<void> signUp({required String email, required String password}) async {
    try {
      emit(AuthLoadingState());
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.sendEmailVerification();
      emit(AuthVerificationSentState());
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message ?? 'An error occurred'));
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      emit(AuthLoadingState());
      await _auth.currentUser?.sendEmailVerification();
      emit(AuthVerificationSentState());
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message ?? 'An error occurred'));
    }
  }

  Future<void> checkEmailVerification() async {
    try {
      emit(AuthLoadingState());
      await _auth.currentUser?.reload();
      final user = _auth.currentUser;

      if (user?.emailVerified ?? false) {
        // Sign in the user after verification
        await _auth.signInWithEmailAndPassword(
          email: user?.email ?? '',
          password: user?.uid ?? '',
        );
        emit(AuthVerifiedState());
      } else {
        emit(AuthNotVerifiedState());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message ?? 'An error occurred'));
    }
  }
}
