import 'package:injectable/injectable.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/data/repositories/firebase_firestore/firestore_manager.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import 'message_state.dart';

@singleton
class MessageCubit extends BaseCubit<MessageState> {
  MessageCubit() : super(const MessageState());

  init() {
    getIt.get<FireStoreManager>().listUserChat.addListener(() {
      emit(state.copyWith(
          listUserChat: getIt.get<FireStoreManager>().listUserChat.value));
    });

    getIt.get<FireStoreManager>().userCurrent.addListener(() {
      emit(state.copyWith(
          currentUser: getIt.get<FireStoreManager>().userCurrent.value));
    });
  }
}
