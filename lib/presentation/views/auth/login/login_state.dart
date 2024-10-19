import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/enums/password_type.dart';

part 'login_state.g.dart';

@CopyWith()
class LoginState extends Equatable {
  final bool? emailValid;
  final bool? phoneValid;
  final PasswordCase? passValidCase;
  final bool? loginSuccess;

  @override
  List<Object?> get props =>
      [emailValid, passValidCase, loginSuccess, phoneValid];

  const LoginState(
      {this.emailValid,
      this.passValidCase,
      this.loginSuccess,
      this.phoneValid});
}
