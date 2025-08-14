import 'package:flutter/material.dart';

class SignUpModel {
  final String username,
      firstName,
      lastName,
      email,
      phoneNumber,
      birthDate,
      password;

  SignUpModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.password,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      birthDate: json["birthDate"],
      password: json["password"],
    );
  }
}
