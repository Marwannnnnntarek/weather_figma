/// Model class to hold user registration data
class UserRegistrationData {
  String name;
  String email;
  String phoneNumber;
  String country;
  String password;

  UserRegistrationData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.password,
  });
}
