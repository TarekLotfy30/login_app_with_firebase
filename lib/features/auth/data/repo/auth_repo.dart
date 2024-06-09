import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

abstract class AuthRepo {
  //dy user beta3t firebase auth
  Stream<User?> get user;

  Future<void> signIn(String email, String password);
  Future<MyUser> signUp(MyUser user, String password);
  Future<void> setUserData(MyUser user);

  // mmkn nezawed b2a hena bera7tna zy logout , reset password , get my user
// , upload picture
}

// mat3mlsh kda b2a ma enta 3amel model lyhom
// Future<MyUser> register(String email, String password, String name);
