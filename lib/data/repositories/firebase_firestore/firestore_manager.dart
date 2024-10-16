import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';

abstract class FireStoreManager {
  init();

  Future<UserStoreDomain?> initUser(UserStoreDomain user);
}

@Singleton(as: FireStoreManager)
class FireStoreManagerImpl extends FireStoreManager {
  final String tag = "FireStoreManager";
  late final FirebaseFirestore _firebaseFirestore;

  @override
  init() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  Future<UserStoreDomain?> initUser(UserStoreDomain user) async {
    final collection = _firebaseFirestore.collection("user");
    try {
      collection
          .doc(user.userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          return UserStoreDomain.fromJson(
              documentSnapshot as Map<String, Object?>);
        } else {
          await collection.doc(user.userId).set(user.toJson());
        }
      });
    } catch (e) {
      log("initUser error: $e", name: tag);
    }
    return null;
  }
}
