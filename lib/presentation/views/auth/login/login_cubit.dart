import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import '../../../../data/di/injector.dart';
// import '../../../../data/repositories/network/api_repository_impl.dart';
import '../../../../data/repositories/firebase_auth/firebase_auth_manager.dart';
import '../../../../data/repositories/firebase_firestore/firestore_manager.dart';
import '../../../../domain/reponses/user_store_reponse.dart';
import '../../../../domain/requests/auth_request.dart';
import 'login_state.dart';

@singleton
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState());

  // final _apiRepository = getIt.get<ApiRepository>();
  // final _userValidation = getIt.get<UserValidate>();

  // void emailValidate({required String email}) {
  //   var isValid = _userValidation.emailValid(email);
  //   emit(state.copyWith(emailValid: isValid));
  // }

  // void phoneValidate({required String phone}) {
  //   var isValid = _userValidation.phoneValid(phone);
  //   emit(state.copyWith(phoneValid: isValid));
  // }

  // void passValidate({required String pass}) {
  //   var isValid = _userValidation.passValid(pass);
  //   emit(state.copyWith(passValidCase: isValid));
  // }

  // listenUser() async {
  //   getIt.get<AuthManager>().currentUser.addListener(() {
  //     final currentUser = getIt.get<AuthManager>().currentUser.value;
  //     log("login: $currentUser");
  //   });
  // }

  Future login(LoginRequest request) async {
    if (isBusy) return;
    await run(() async {
      final isLogined =
          await getIt.get<AuthManager>().loginWithEmailAndPassword(request);
      if (isLogined) {
        final user = getIt.get<AuthManager>().currentUser.value;
        if (user != null) {
          final userDomain = UserStoreDomain(
              avatar: user.photoURL, name: user.displayName, userId: user.uid);
          await getIt.get<FireStoreManager>().initUser(userDomain);
        }

        emit(state.copyWith(loginSuccess: true));
      } else {
        emit(state.copyWith(loginSuccess: false));
      }
      _clearState();
    });
  }

  _clearState() {
    Timer(const Duration(seconds: 1), () {
      emit(state.copyWith(loginSuccess: null));
    });
  }
}
