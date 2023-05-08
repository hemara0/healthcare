import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});

  static User fromJson(json) => User(name: json["name"], email: json["email"]);
}
