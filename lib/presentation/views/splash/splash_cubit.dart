import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/data/repositories/firebase_auth/firebase_auth_manager.dart';
import 'package:softbase/data/repositories/firebase_firestore/firestore_manager.dart';
import 'package:softbase/domain/reponses/user_store_reponse.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/splash/splash_state.dart';

@singleton
class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future init() async {
    final currentUser = getIt.get<AuthManager>().currentUser;
    if (currentUser != null) {
      final userStorage = UserStoreDomain(
          name: currentUser.displayName ?? "Empty name",
          userId: currentUser.uid);
      await getIt.get<FireStoreManager>().initUser(userStorage);
    }
    Timer(const Duration(milliseconds: 300), () {
      emit(state.copyWith(isSuccess: true));
    });
  }
}
