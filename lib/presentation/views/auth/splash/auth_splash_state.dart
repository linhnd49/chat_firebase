import 'package:equatable/equatable.dart';

class AuthSplashState extends Equatable {
  final bool? loginSuccess;

  const AuthSplashState({this.loginSuccess});

  @override
  List<Object?> get props => [loginSuccess];
}
