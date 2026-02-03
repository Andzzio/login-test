import 'package:firebase_app/domain/entities/user.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;

  UserModel({required this.uid, required this.email, required this.name});

  User toUserEntity() {
    return User(uid: uid, email: email, name: name);
  }
}
