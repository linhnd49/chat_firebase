import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import 'message_state.dart';

@singleton
class MessageCubit extends BaseCubit<MessageState> {
  MessageCubit() : super(const MessageState());
}
