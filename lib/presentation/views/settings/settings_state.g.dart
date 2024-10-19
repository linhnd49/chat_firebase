// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsStateCWProxy {
  SettingsState userInfo(UserStoreDomain? userInfo);

  SettingsState isLogoutSuccess(bool? isLogoutSuccess);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    UserStoreDomain? userInfo,
    bool? isLogoutSuccess,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsState.copyWith.fieldName(...)`
class _$SettingsStateCWProxyImpl implements _$SettingsStateCWProxy {
  const _$SettingsStateCWProxyImpl(this._value);

  final SettingsState _value;

  @override
  SettingsState userInfo(UserStoreDomain? userInfo) => this(userInfo: userInfo);

  @override
  SettingsState isLogoutSuccess(bool? isLogoutSuccess) =>
      this(isLogoutSuccess: isLogoutSuccess);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsState(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsState call({
    Object? userInfo = const $CopyWithPlaceholder(),
    Object? isLogoutSuccess = const $CopyWithPlaceholder(),
  }) {
    return SettingsState(
      userInfo: userInfo == const $CopyWithPlaceholder()
          ? _value.userInfo
          // ignore: cast_nullable_to_non_nullable
          : userInfo as UserStoreDomain?,
      isLogoutSuccess: isLogoutSuccess == const $CopyWithPlaceholder()
          ? _value.isLogoutSuccess
          // ignore: cast_nullable_to_non_nullable
          : isLogoutSuccess as bool?,
    );
  }
}

extension $SettingsStateCopyWith on SettingsState {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsState.copyWith(...)` or like so:`instanceOfSettingsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsStateCWProxy get copyWith => _$SettingsStateCWProxyImpl(this);
}
