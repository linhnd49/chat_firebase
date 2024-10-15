// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactsStateCWProxy {
  ContactsState listContact(Map<String, List<UserStoreDomain>>? listContact);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactsState call({
    Map<String, List<UserStoreDomain>>? listContact,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContactsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContactsState.copyWith.fieldName(...)`
class _$ContactsStateCWProxyImpl implements _$ContactsStateCWProxy {
  const _$ContactsStateCWProxyImpl(this._value);

  final ContactsState _value;

  @override
  ContactsState listContact(Map<String, List<UserStoreDomain>>? listContact) =>
      this(listContact: listContact);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContactsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContactsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContactsState call({
    Object? listContact = const $CopyWithPlaceholder(),
  }) {
    return ContactsState(
      listContact: listContact == const $CopyWithPlaceholder()
          ? _value.listContact
          // ignore: cast_nullable_to_non_nullable
          : listContact as Map<String, List<UserStoreDomain>>?,
    );
  }
}

extension $ContactsStateCopyWith on ContactsState {
  /// Returns a callable class that can be used as follows: `instanceOfContactsState.copyWith(...)` or like so:`instanceOfContactsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactsStateCWProxy get copyWith => _$ContactsStateCWProxyImpl(this);
}
