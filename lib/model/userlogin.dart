import 'dart:math';

class UserLogin {
  String userName;
  String password;
  String patientId;
  bool validate;

  UserLogin(
      {required this.userName,
      required this.password,
      required this.patientId,
      required this.validate});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        userName: json['username'],
        password: json['password'],
        patientId: json['patient_id'],
        validate: json['validate']);
  }
}
