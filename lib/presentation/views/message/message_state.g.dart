// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageStateCWProxy {
  MessageState error(DioException? error);

  MessageState noMoreData(bool? noMoreData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    DioException? error,
    bool? noMoreData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessageState.copyWith.fieldName(...)`
class _$MessageStateCWProxyImpl implements _$MessageStateCWProxy {
  const _$MessageStateCWProxyImpl(this._value);

  final MessageState _value;

  @override
  MessageState error(DioException? error) => this(error: error);

  @override
  MessageState noMoreData(bool? noMoreData) => this(noMoreData: noMoreData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    Object? error = const $CopyWithPlaceholder(),
    Object? noMoreData = const $CopyWithPlaceholder(),
  }) {
    return MessageState(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as DioException?,
      noMoreData: noMoreData == const $CopyWithPlaceholder()
          ? _value.noMoreData
          // ignore: cast_nullable_to_non_nullable
          : noMoreData as bool?,
    );
  }
}

extension $MessageStateCopyWith on MessageState {
  /// Returns a callable class that can be used as follows: `instanceOfMessageState.copyWith(...)` or like so:`instanceOfMessageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageStateCWProxy get copyWith => _$MessageStateCWProxyImpl(this);
}
