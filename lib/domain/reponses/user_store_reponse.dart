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

enum MessageType { text, image, video, file }

enum MessageStatusType { receive, sender }

class ConversationDomain {
  final String? message;
  final MessageType? type;
  final MessageStatusType? statusType;
  final String? userId;
  final String? messageId;
  final String? time;

  ConversationDomain(
      {this.message,
      this.statusType,
      this.type,
      this.userId,
      this.messageId,
      this.time});

  ConversationDomain.fromJson(Map<String, Object?> json)
      : this(
            message: json["message"] as String?,
            type: MessageType.values.firstWhere(
                (element) => element.name == json["messageType"] as String?),
            statusType: MessageStatusType.values.firstWhere(
                (element) => element.name == json["status"] as String?),
            messageId: json["msgId"] as String?,
            time: json["timestamp"] as String?);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'message': message,
      'messageType': type,
      'status': statusType,
      'msgId': messageId,
      'timestamp': time
    };
  }

  ConversationDomain.fromQueryDocumentSnapshot(DocumentSnapshot snap)
      : message = snap.get('message') as String?,
        userId = snap.get('userId') as String?,
        type = MessageType.values.firstWhere(
            (element) => element.name == snap.get('messageType') as String?),
        statusType = MessageStatusType.values.firstWhere(
            (element) => element.name == snap.get('status') as String?),
        messageId = snap.get('msgId') as String?,
        time = snap.get('timestamp') as String?;
}
