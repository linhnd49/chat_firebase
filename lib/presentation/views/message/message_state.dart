import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';

part 'message_state.g.dart';

@CopyWith()
class MessageState extends Equatable {
  final List<UserStoreDomain>? listUserChat;
  final UserStoreDomain? currentUser;

  const MessageState({this.listUserChat, this.currentUser});

  @override
  List<Object?> get props => [listUserChat, currentUser];
}
