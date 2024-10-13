// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../presentation/views/auth/forgot_pass/forgot_pass_cubit.dart'
    as _i8;
import '../../presentation/views/auth/login/login_cubit.dart' as _i10;
import '../../presentation/views/auth/register/register_cubit.dart' as _i12;
import '../../presentation/views/bottom/bottom_cubit.dart' as _i4;
import '../../presentation/views/chat/chat_cubit.dart' as _i5;
import '../../presentation/views/contacts/contacts_cubit.dart' as _i6;
import '../../presentation/views/message/message_cubit.dart' as _i11;
import '../../presentation/views/search/search_cubit.dart' as _i14;
import '../../presentation/views/theme_manager/theme_manager.dart' as _i15;
import '../datasources/firebase/events/analytic_events.dart' as _i3;
import '../datasources/firebase/remote_config/remote_config_manager.dart'
    as _i13;
import '../datasources/local/local_storage.dart' as _i9;
import '../repositories/firestore/firestore_manager.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetit(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AnalyticEvent>(_i3.AnalyticEventImpl());
  gh.singleton<_i4.BottomCubit>(_i4.BottomCubit());
  gh.singleton<_i5.ChatCubit>(_i5.ChatCubit());
  gh.singleton<_i6.ContactsCubit>(_i6.ContactsCubit());
  gh.singleton<_i7.FireStoreManager>(_i7.FireStoreManagerImpl());
  gh.singleton<_i8.ForgotPassCubit>(_i8.ForgotPassCubit());
  gh.singleton<_i9.LocalStorage>(_i9.LocalStorageImpl());
  gh.singleton<_i10.LoginCubit>(_i10.LoginCubit());
  gh.singleton<_i11.MessageCubit>(_i11.MessageCubit());
  gh.singleton<_i12.RegisterCubit>(_i12.RegisterCubit());
  gh.singleton<_i13.RemoteConfigService>(_i13.RemoteConfigService());
  gh.singleton<_i14.SearchCubit>(_i14.SearchCubit());
  gh.singleton<_i15.ThemeManager>(_i15.ThemeManager());
  return getIt;
}
