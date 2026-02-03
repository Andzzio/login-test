import 'package:firebase_app/data/models/user_model.dart';
import 'package:firebase_app/domain/datasources/datasources.dart';
import 'package:firebase_app/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class FbAuthDatasource implements Datasource {
  final fb.FirebaseAuth _firebaseAuth;

  FbAuthDatasource({required fb.FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  @override
  Future<User> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName ?? "",
      ).toUserEntity();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
