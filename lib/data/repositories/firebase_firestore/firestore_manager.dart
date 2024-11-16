import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';

abstract class FireStoreManager {
  init();

  Future<UserStoreDomain?> initUser(UserStoreDomain user);

  ValueNotifier<UserStoreDomain?> get userCurrent;

  ValueNotifier<List<UserStoreDomain>> get listUserChat;

  // Future<List<ConversationDomain>> listConversation

  Future<List<ConversationDomain>> listMsgFromID(
      {required String userId, required String userCurrentId});
}

@Singleton(as: FireStoreManager)
class FireStoreManagerImpl extends FireStoreManager {
  final String tag = "FireStoreManager";
  late final FirebaseFirestore _firebaseFirestore;
  late final ValueNotifier<UserStoreDomain?> _userCurrent;
  late final ValueNotifier<List<UserStoreDomain>> _listChat;

  @override
  init() {
    _firebaseFirestore = FirebaseFirestore.instance;
    _userCurrent = ValueNotifier<UserStoreDomain?>(null);
    _listChat = ValueNotifier<List<UserStoreDomain>>([]);
  }

  @override
  Future<UserStoreDomain?> initUser(UserStoreDomain user) async {
    try {
      final collection = _firebaseFirestore.collection("user");
      await collection.doc(user.userId).get().then((document) async {
        if (document.exists) {
          final user = UserStoreDomain.fromQueryDocumentSnapshot(document);
          _userCurrent.value = user;
          listUserChat.value = await _initListChat(user.userId!);
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
  ValueNotifier<UserStoreDomain?> get userCurrent => _userCurrent;

  Future<List<UserStoreDomain>> _initListChat(String userId) async {
    try {
      final col = _firebaseFirestore.collection("user");

      final colChild = await col.doc(userId).collection("conversations").get();

      final listDocs = colChild.docs.map((e) {
        final checl = ConversationDomain.fromQueryDocumentSnapshot(e);
        return checl;
      }).toList();

      final listAllUser = (await col.get())
          .docs
          .map((e) => UserStoreDomain.fromQueryDocumentSnapshot(e))
          .toList();

      final result = <UserStoreDomain>[];

      for (var element in listDocs) {
        final user = listAllUser.firstWhere((e) => e.userId == element.userId);
        result.add(user);
      }

      return result;
    } catch (e) {
      log("initListChat error: $e", name: tag);
    }
    return <UserStoreDomain>[];
  }

  @override
  ValueNotifier<List<UserStoreDomain>> get listUserChat => _listChat;

  @override
  Future<List<ConversationDomain>> listMsgFromID(
      {required String userId, required String userCurrentId}) async {
    try {
      final docs = await _firebaseFirestore
          .collection("user")
          .doc(userCurrentId)
          .collection("conversations")
          .doc(userId)
          .collection("message")
          .get();

      final listMsg = docs.docs
          .map((e) => ConversationDomain.fromQueryDocumentSnapshot(e))
          .toList();

      return listMsg;
    } catch (e) {
      log("listMsgFromID error: $e", name: tag);
    }
    return <ConversationDomain>[];
  }
}
