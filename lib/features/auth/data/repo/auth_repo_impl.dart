import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<MyUser> signUp(MyUser user, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();
}
