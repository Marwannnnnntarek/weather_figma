abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthVerificationSentState extends AuthStates {}

class AuthVerifiedState extends AuthStates {}

class AuthNotVerifiedState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String message;
  AuthErrorState(this.message);
}
