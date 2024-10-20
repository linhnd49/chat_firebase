import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';

import 'bottom_tab.dart';

@singleton
class BottomCubit extends BaseCubit<BottomTab> {
  BottomCubit() : super(BottomTab.message);

  void updateTab(BottomTab tab) {
    emit(tab);
  }
}
