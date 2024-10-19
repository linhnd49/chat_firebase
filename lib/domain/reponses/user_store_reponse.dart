import 'package:cloud_firestore/cloud_firestore.dart';

class UserStoreDomain {
  String? userId;
  String? name;
  String? avatar;
  String? description;
  UserStoreDomain(
      {this.avatar,
      this.description = "Your description profile",
      this.name,
      this.userId});

  UserStoreDomain.fromJson(Map<String, Object?> json)
      : this(
            userId: json["userId"] as String,
            name: json["name"] as String,
            avatar: json["avatar"] as String,
            description: json["description"] as String);

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'name': name,
      'avatar': avatar,
      'description': description,
    };
  }

  UserStoreDomain.fromQueryDocumentSnapshot(DocumentSnapshot snap)
      : userId = snap.get('userId') as String?,
        avatar = snap.get('avatar') as String?,
        name = snap.get('name') as String?,
        description = snap.get('description') as String?;
}
