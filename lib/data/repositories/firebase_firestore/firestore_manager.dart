import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FireStoreManager {
  // Future readData();
  // Future addData({String? name});
  // Future updateData({String? name});

  init();

  Future<bool> getUser(String userId);
}

@Singleton(as: FireStoreManager)
class FireStoreManagerImpl extends FireStoreManager {
  late final FirebaseFirestore _firebaseFirestore;

  @override
  init() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  Future<bool> getUser(String userId) async {
    final _collection = _firebaseFirestore.collection("user");
    try {
      _collection.doc(userId).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
        } else {
          // _collection.add()
        }
      });
    } catch (_) {}
    return false;
  }

  // @override
  // Future addData({String? name}) {
  //   return _collection.add({
  //     'name': name,
  //   });
  // }

  // @override
  // Future readData() {
  //   return _collection.doc("").get();
  // }

  // @override
  // Future updateData({String? name}) {
  //   return _collection.doc("").update({
  //     'name': name,
  //   });
  // }
}
