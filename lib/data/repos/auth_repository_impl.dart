import 'package:firebase_app/domain/datasources/datasources.dart';
import 'package:firebase_app/domain/entities/user.dart';
import 'package:firebase_app/domain/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Datasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<User> login(String email, String password) async {
    return datasource.login(email, password);
  }

  @override
  Future<void> logout() async {
    await datasource.logout();
  }
}
