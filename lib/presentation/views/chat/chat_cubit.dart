import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/chat/chat_state.dart';
import 'package:softbase/presentation/views/chat/domain/chat_item_domain.dart';

@singleton
class ChatCubit extends BaseCubit<ChatState> {
  ChatCubit() : super(const ChatState());

  final List<ChatItemDomain> _listChat = [
    ChatItemDomain(
        id: "1",
        content: "Hello! Jhon abraham",
        msgType: MessageType.text,
        userType: UserType.sender,
        time: "9:25 AM"),
    ChatItemDomain(
        id: "2",
        msgType: MessageType.text,
        content: "Hello ! Nazrul How are you?",
        userType: UserType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:26 AM"),
    ChatItemDomain(
        id: "1",
        msgType: MessageType.text,
        content: "You did your job well!",
        userType: UserType.sender,
        time: "9:27 AM"),
    ChatItemDomain(
        id: "2",
        msgType: MessageType.text,
        content: "Have a great working week!!",
        userType: UserType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:28 AM"),
    ChatItemDomain(
        id: "2",
        msgType: MessageType.text,
        content: "Hope you like it",
        userType: UserType.receiver,
        avatar:
            "https://r2-us-west.photoai.com/1726197655-a084e60fa79f1e504722e8fb921f23b4-3.png",
        name: "Jhon Abraham",
        time: "9:29 AM"),
    ChatItemDomain(
        id: "1",
        msgType: MessageType.text,
        content: "Is there any thing wrong?",
        userType: UserType.sender,
        time: "9:29 AM"),
    ChatItemDomain(
        id: "1",
        msgType: MessageType.text,
        content: "Are you here?",
        userType: UserType.sender,
        time: "9:30 AM")
  ];

  initChat() {
    final newList = _compareListChat(_listChat).reversed.toList();
    emit(state.copyWith(listChat: newList));
  }

  List<ChatItemDomain> _compareListChat(List<ChatItemDomain> listMsg) {
    List<ChatItemDomain> newList = [];

    for (int i = 0; i < listMsg.length; i++) {
      if (i == 0 || listMsg[i].id != listMsg[i - 1].id) {
        newList.add(listMsg[i].copyWith(isFirstMsg: true));
      } else {
        newList.add(ChatItemDomain(
            msgType: listMsg[i].msgType,
            content: listMsg[i].content,
            userType: listMsg[i].userType,
            time: listMsg[i].time,
            id: listMsg[i].id));
      }
    }
    return newList;
  }
}
