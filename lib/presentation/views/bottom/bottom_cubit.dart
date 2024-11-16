import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import '../../../data/di/injector.dart';
import '../../../data/repositories/firebase_auth/firebase_auth_manager.dart';
import '../../../data/repositories/firebase_firestore/firestore_manager.dart';
import '../../../domain/reponses/user_store_reponse.dart';
import 'bottom_tab.dart';

@singleton
class BottomCubit extends BaseCubit<BottomTab> {
  BottomCubit() : super(BottomTab.message);

  init() async {
    final currentUser = getIt.get<AuthManager>().currentUser.value;
    if (currentUser != null) {
      final userStorage = UserStoreDomain(
          name: currentUser.displayName != "" && currentUser.displayName != null
              ? currentUser.displayName!
              : "Empty name",
          userId: currentUser.uid);
      await getIt.get<FireStoreManager>().initUser(userStorage);
    }
  }

  void updateTab(BottomTab tab) {
    emit(tab);
  }
}
