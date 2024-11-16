import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:softbase/data/repositories/firebase_firestore/firestore_manager.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/auth/register/register_state.dart';

import '../../../../data/di/injector.dart';
// import '../../../../data/repositories/network/api_repository_impl.dart';
import '../../../../data/repositories/firebase_auth/firebase_auth_manager.dart';
import '../../../../domain/requests/auth_request.dart';

@singleton
class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  // final _userValidation = getIt.get<UserValidate>();

  // void emailValidate({required String email}) {
  //   var isValid = _userValidation.emailValid(email);
  //   // emit(state.copyWith(emailValid: isValid));
  // }

  // void phoneValidate({required String phone}) {
  //   var isValid = _userValidation.phoneValid(phone);
  //   // emit(state.copyWith(phoneValid: isValid));
  // }

  // void passValidate({required String pass}) {
  //   var isValid = _userValidation.passValid(pass);
  //   // emit(state.copyWith(passValidCase: isValid));
  // }

  Future createAccountWithEmail(SignUpRequest request) async {
    if (isBusy) return;
    await run(() async {
      final reponse =
          await getIt.get<AuthManager>().createAccountWithEmail(request);
      if (reponse != null) {
        final user = UserStoreDomain(
            avatar: reponse.photoURL, name: request.name, userId: reponse.uid);
        await getIt.get<FireStoreManager>().initUser(user);
        // await getIt.get<FireStoreManager>().initAllUser();
        emit(state.copyWith(isSuccess: true));
      } else {
        emit(state.copyWith(isSuccess: false));
      }
      _clearState();
    });
  }

  _clearState() {
    Timer(const Duration(seconds: 1), () {
      emit(state.copyWith(isSuccess: null));
    });
  }
}
