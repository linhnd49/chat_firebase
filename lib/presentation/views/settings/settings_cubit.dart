import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/contacts/domain/contacts_domain.dart';
import 'package:softbase/presentation/views/settings/settings_state.dart';

@singleton
class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  final personInfo = ContactsItemDomain(
      avatar:
          "https://images.pexels.com/photos/28494944/pexels-photo-28494944.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      name: "Nazrul Islam",
      description: "Never give up 💪",
      id: "2");

  initSetting() {
    emit(state.copyWith(userInfo: personInfo));
  }
}
