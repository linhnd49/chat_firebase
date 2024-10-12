import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/chat/chat_state.dart';
import 'package:softbase/presentation/views/chat/domain/chat_item_domain.dart';

@singleton
class ChatCubit extends BaseCubit<ChatState> {
  ChatCubit() : super(const ChatState());

  final List<ChatItemDomain> _listChat = [
    ChatItemDomain(
        content: "Hello! Jhon abraham",
        type: MessageType.sender,
        time: "9:25 AM"),
    ChatItemDomain(
        content: "Hello ! Nazrul How are you?",
        type: MessageType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:26 AM"),
    ChatItemDomain(
        content: "You did your job well!",
        type: MessageType.sender,
        time: "9:27 AM"),
    ChatItemDomain(
        content: "Have a great working week!!",
        type: MessageType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:28 AM"),
    ChatItemDomain(
        content: "Hope you like it",
        type: MessageType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:29 AM"),
    ChatItemDomain(
        content: "Is there any thing wrong?",
        type: MessageType.sender,
        time: "9:29 AM")
  ];

  initChat() {
    final reversedList = _listChat.reversed.toList();
    emit(state.copyWith(listChat: reversedList));
  }
}
