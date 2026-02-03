import 'package:firebase_app/domain/entities/user.dart';

abstract class Datasource {
  Future<User> login(String email, String password);
  Future<void> logout();
}
