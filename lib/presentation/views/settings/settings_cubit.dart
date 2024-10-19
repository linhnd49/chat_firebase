import 'package:injectable/injectable.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/data/repositories/firebase_auth/firebase_auth_manager.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/settings/settings_state.dart';

import '../../../domain/reponses/user_store_reponse.dart';

@singleton
class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  final _authManager = getIt.get<AuthManager>();

  final personInfo = UserStoreDomain(
      avatar:
          "https://images.pexels.com/photos/28494944/pexels-photo-28494944.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      name: "Nazrul Islam",
      description: "Never give up 💪",
      userId: "2");

  initSetting() {
    emit(state.copyWith(userInfo: personInfo));
  }

  Future logout() async {
    final result = await _authManager.logout();
    if (result) {
      emit(state.copyWith(isLogoutSuccess: true));
    } else {
      emit(state.copyWith(isLogoutSuccess: false));
    }
    _clearState();
  }

  _clearState() {
    emit(state.copyWith(isLogoutSuccess: null));
  }
}
