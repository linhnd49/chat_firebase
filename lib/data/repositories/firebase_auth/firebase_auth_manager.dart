import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:softbase/domain/requests/auth_request.dart';

abstract class AuthManager {
  Future init();

  Future<bool> loginWithGoogle();

  Future<bool> loginWithFacebook();

  Future<bool> loginWithApple();

  Future<bool> createAccountWithEmail(SignUpRequest request);

  User? get currentUser;

  bool get isLogined;
}

@Singleton(as: AuthManager)
class AuthManagerImpl extends AuthManager {
  final String tag = "AuthManager";

  late final FirebaseAuth _auth;
  late final User? _currentUser;

  @override
  Future init() async {
    _auth = FirebaseAuth.instance;
    _currentUser = _auth.currentUser;
  }

  @override
  Future<bool> createAccountWithEmail(SignUpRequest request) async {
    try {
      _auth.createUserWithEmailAndPassword(
          email: request.email, password: request.password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.', name: tag);
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.', name: tag);
      } else {
        log("createAccountWithEmail catch error: $e", name: tag);
      }
    }
    return false;
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
  User? get currentUser => _currentUser;

  @override
  bool get isLogined => _currentUser != null;
}
