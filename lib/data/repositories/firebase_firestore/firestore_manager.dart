import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';

abstract class FireStoreManager {
  init();

  Future<UserStoreDomain?> initUser(UserStoreDomain user);

  ValueNotifier<UserStoreDomain?> get userStorage;
}

@Singleton(as: FireStoreManager)
class FireStoreManagerImpl extends FireStoreManager {
  final String tag = "FireStoreManager";
  late final FirebaseFirestore _firebaseFirestore;
  late final ValueNotifier<UserStoreDomain?> _userStorage;

  @override
  init() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _userStorage = ValueNotifier<UserStoreDomain?>(null);
  }

  @override
  Future<UserStoreDomain?> initUser(UserStoreDomain user) async {
    final collection = _firebaseFirestore.collection("user");
    try {
      collection.doc(user.userId).get().then((document) async {
        if (document.exists) {
          final user = UserStoreDomain.fromQueryDocumentSnapshot(document);
          _userStorage.value = user;
          return user;
        } else {
          await collection.doc(user.userId).set(user.toJson());
          initUser(user);
        }
      });
    } catch (e) {
      log("initUser error: $e", name: tag);
    }
    return null;
  }

  @override
  ValueNotifier<UserStoreDomain?> get userStorage => _userStorage;
}
