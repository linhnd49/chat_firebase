// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatStateCWProxy {
  ChatState listChat(List<ChatItemDomain>? listChat);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatState call({
    List<ChatItemDomain>? listChat,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatState.copyWith.fieldName(...)`
class _$ChatStateCWProxyImpl implements _$ChatStateCWProxy {
  const _$ChatStateCWProxyImpl(this._value);

  final ChatState _value;

  @override
  ChatState listChat(List<ChatItemDomain>? listChat) =>
      this(listChat: listChat);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatState call({
    Object? listChat = const $CopyWithPlaceholder(),
  }) {
    return ChatState(
      listChat: listChat == const $CopyWithPlaceholder()
          ? _value.listChat
          // ignore: cast_nullable_to_non_nullable
          : listChat as List<ChatItemDomain>?,
    );
  }
}

extension $ChatStateCopyWith on ChatState {
  /// Returns a callable class that can be used as follows: `instanceOfChatState.copyWith(...)` or like so:`instanceOfChatState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatStateCWProxy get copyWith => _$ChatStateCWProxyImpl(this);
}
