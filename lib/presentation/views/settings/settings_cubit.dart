import 'package:injectable/injectable.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/data/repositories/firebase_auth/firebase_auth_manager.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/settings/settings_state.dart';

import '../../../data/repositories/firebase_firestore/firestore_manager.dart';

@singleton
class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  final _authManager = getIt.get<AuthManager>();

  initSetting() {
    final currentUser = getIt.get<FireStoreManager>().userCurrent.value;
    emit(state.copyWith(userInfo: currentUser));
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
