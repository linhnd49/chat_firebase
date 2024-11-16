import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:softbase/domain/requests/auth_request.dart';

abstract class AuthManager {
  Future init();

  Future<bool> loginWithGoogle();

  Future<bool> loginWithFacebook();

  Future<bool> loginWithApple();

  Future<bool> loginWithEmailAndPassword(LoginRequest request);

  Future<User?> createAccountWithEmail(SignUpRequest request);

  Future<bool> logout();

  ValueNotifier<User?> get currentUser;

  bool get isLogined;
}

@Singleton(as: AuthManager)
class AuthManagerImpl extends AuthManager {
  final String tag = "AuthManager";

  late final FirebaseAuth _auth;
  late final ValueNotifier<User?> _currentUser;

  @override
  Future init() async {
    _auth = FirebaseAuth.instance;
    _currentUser = ValueNotifier<User?>(_auth.currentUser);
  }

  @override
  Future<User?> createAccountWithEmail(SignUpRequest request) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: request.email.trim(), password: request.password.trim());
      final user = credential.user;
      _currentUser.value = user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.', name: tag);
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.', name: tag);
      } else {
        log("createAccountWithEmail catch error: $e", name: tag);
      }
    }
    return null;
  }

  @override
  Future<bool> loginWithApple() async {
    //to do code
    return true;
  }

  @override
  Future<bool> loginWithFacebook() async {
    //to do code
    return true;
  }

  @override
  Future<bool> loginWithGoogle() async {
    //to do code
    return true;
  }

  @override
  ValueNotifier<User?> get currentUser => _currentUser;

  @override
  bool get isLogined => _currentUser.value != null;

  @override
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (_) {}
    return false;
  }

  @override
  Future<bool> loginWithEmailAndPassword(LoginRequest request) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: request.username.trim(), password: request.password.trim());
      _currentUser.value = userCredential.user;
      return true;
    } catch (_) {}
    return false;
  }
}
