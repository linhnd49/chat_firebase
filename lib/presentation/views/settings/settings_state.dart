import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:softbase/presentation/views/contacts/domain/contacts_domain.dart';

part 'settings_state.g.dart';

@CopyWith()
class SettingsState extends Equatable {
  final ContactsItemDomain? userInfo;
  const SettingsState({this.userInfo});
  @override
  List<Object?> get props => [userInfo];
}
