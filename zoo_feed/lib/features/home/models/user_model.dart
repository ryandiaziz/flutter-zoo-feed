// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  String imageUrl;
  int age;
  int roleId;
  int iat;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.age,
    required this.roleId,
    required this.iat,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        age: json["age"],
        roleId: json["roleId"],
        iat: json["iat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "age": age,
        "roleId": roleId,
        "iat": iat,
      };
}
