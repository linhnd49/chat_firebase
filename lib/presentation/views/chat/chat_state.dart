import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import 'domain/chat_item_domain.dart';

part 'chat_state.g.dart';

@CopyWith()
class ChatState extends Equatable {
  final List<ChatItemDomain>? listChat;

  const ChatState({this.listChat});

  @override
  List<Object?> get props => [listChat];
}
