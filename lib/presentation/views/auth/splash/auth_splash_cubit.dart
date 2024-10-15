import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/auth/splash/auth_splash_state.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

@singleton
class AuthSplashCubit extends BaseCubit<AuthSplashState> {
  AuthSplashCubit() : super(const AuthSplashState());

  Future<bool> loginWithFacebook() async {
    //code to do
    return true;
  }

  Future<bool> loginWithGoogle() async {
    //code to do
    return true;
  }

  Future<bool> loginWithApple() async {
    //code to do
    return true;
  }
}
