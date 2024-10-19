// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState emailValid(bool? emailValid);

  LoginState passValidCase(PasswordCase? passValidCase);

  LoginState loginSuccess(bool? loginSuccess);

  LoginState phoneValid(bool? phoneValid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    bool? emailValid,
    PasswordCase? passValidCase,
    bool? loginSuccess,
    bool? phoneValid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState emailValid(bool? emailValid) => this(emailValid: emailValid);

  @override
  LoginState passValidCase(PasswordCase? passValidCase) =>
      this(passValidCase: passValidCase);

  @override
  LoginState loginSuccess(bool? loginSuccess) =>
      this(loginSuccess: loginSuccess);

  @override
  LoginState phoneValid(bool? phoneValid) => this(phoneValid: phoneValid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? emailValid = const $CopyWithPlaceholder(),
    Object? passValidCase = const $CopyWithPlaceholder(),
    Object? loginSuccess = const $CopyWithPlaceholder(),
    Object? phoneValid = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
      emailValid: emailValid == const $CopyWithPlaceholder()
          ? _value.emailValid
          // ignore: cast_nullable_to_non_nullable
          : emailValid as bool?,
      passValidCase: passValidCase == const $CopyWithPlaceholder()
          ? _value.passValidCase
          // ignore: cast_nullable_to_non_nullable
          : passValidCase as PasswordCase?,
      loginSuccess: loginSuccess == const $CopyWithPlaceholder()
          ? _value.loginSuccess
          // ignore: cast_nullable_to_non_nullable
          : loginSuccess as bool?,
      phoneValid: phoneValid == const $CopyWithPlaceholder()
          ? _value.phoneValid
          // ignore: cast_nullable_to_non_nullable
          : phoneValid as bool?,
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
