enum UserType { receiver, sender }

enum MessageType { video, image, audio, text, file }

class ChatItemDomain {
  final dynamic content;
  final UserType userType;
  final MessageType msgType;
  final String? name;
  final String? avatar;
  final String time;
  final String id;
  final bool? isFirstMsg;

  ChatItemDomain(
      {required this.content,
      required this.userType,
      this.avatar,
      this.name,
      required this.time,
      required this.msgType,
      required this.id,
      this.isFirstMsg = false});

  ChatItemDomain copyWith({
    dynamic content,
    UserType? userType,
    MessageType? msgType,
    String? name,
    String? avatar,
    String? time,
    String? id,
    bool? isFirstMsg,
  }) {
    return ChatItemDomain(
        content: content ?? this.content,
        userType: userType ?? this.userType,
        time: time ?? this.time,
        msgType: msgType ?? this.msgType,
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        isFirstMsg: isFirstMsg ?? this.isFirstMsg);
  }
}
