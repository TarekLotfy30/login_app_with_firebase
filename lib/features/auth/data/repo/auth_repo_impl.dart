import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final _userCollection = FirebaseFirestore.instance.collection('users');

  @override
  //return stream of user of firebase authentication user not our user
  Stream<User?> get user {
    //this method will going to be triggered every time that there is a change
    //in the user either the user is authenticated or not

    // every time user will sign in this stream  method will triggered
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser user, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      //update the user object with the right Id
      user = user.copyWith(userId: userCredential.user!.uid);
      // return the updated user object
      return user;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      // .set because i am seting data
      await _userCollection.doc(user.userId).set(user.toFirebase());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
