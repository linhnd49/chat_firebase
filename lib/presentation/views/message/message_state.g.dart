// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageStateCWProxy {
  MessageState listUserChat(List<UserStoreDomain>? listUserChat);

  MessageState currentUser(UserStoreDomain? currentUser);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    List<UserStoreDomain>? listUserChat,
    UserStoreDomain? currentUser,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessageState.copyWith.fieldName(...)`
class _$MessageStateCWProxyImpl implements _$MessageStateCWProxy {
  const _$MessageStateCWProxyImpl(this._value);

  final MessageState _value;

  @override
  MessageState listUserChat(List<UserStoreDomain>? listUserChat) =>
      this(listUserChat: listUserChat);

  @override
  MessageState currentUser(UserStoreDomain? currentUser) =>
      this(currentUser: currentUser);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    Object? listUserChat = const $CopyWithPlaceholder(),
    Object? currentUser = const $CopyWithPlaceholder(),
  }) {
    return MessageState(
      listUserChat: listUserChat == const $CopyWithPlaceholder()
          ? _value.listUserChat
          // ignore: cast_nullable_to_non_nullable
          : listUserChat as List<UserStoreDomain>?,
      currentUser: currentUser == const $CopyWithPlaceholder()
          ? _value.currentUser
          // ignore: cast_nullable_to_non_nullable
          : currentUser as UserStoreDomain?,
    );
  }
}

extension $MessageStateCopyWith on MessageState {
  /// Returns a callable class that can be used as follows: `instanceOfMessageState.copyWith(...)` or like so:`instanceOfMessageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageStateCWProxy get copyWith => _$MessageStateCWProxyImpl(this);
}
