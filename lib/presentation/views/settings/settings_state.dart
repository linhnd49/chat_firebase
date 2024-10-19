import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/reponses/user_store_reponse.dart';

part 'settings_state.g.dart';

@CopyWith()
class SettingsState extends Equatable {
  final UserStoreDomain? userInfo;
  final bool? isLogoutSuccess;
  const SettingsState({this.userInfo, this.isLogoutSuccess});
  @override
  List<Object?> get props => [userInfo, isLogoutSuccess];
}
