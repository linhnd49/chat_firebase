enum MessageType { receiver, sender }

class ChatItemDomain {
  final String content;
  final MessageType type;
  final String? name;
  final String? avatar;
  final String time;
  ChatItemDomain(
      {required this.content,
      required this.type,
      this.avatar,
      this.name,
      required this.time});
}
