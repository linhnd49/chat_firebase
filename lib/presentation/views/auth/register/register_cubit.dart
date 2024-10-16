import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/auth/register/register_state.dart';
import 'package:softbase/utils/resources/data_state.dart';

import '../../../../data/di/injector.dart';
// import '../../../../data/repositories/network/api_repository_impl.dart';
import '../../../../data/repositories/firebase_auth/firebase_auth_manager.dart';
import '../../../../domain/requests/auth_request.dart';
import '../../../../utils/validations/user_validation.dart';

@singleton
class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final _userValidation = getIt.get<UserValidate>();
  final _authFirebase = getIt.get<AuthManager>();

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
      final reponse = await _authFirebase.createAccountWithEmail(request);
      if (reponse) {

      }
    });
  }
}
