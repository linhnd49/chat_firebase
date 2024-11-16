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
    as _i10;
import '../../presentation/views/auth/login/login_cubit.dart' as _i12;
import '../../presentation/views/auth/register/register_cubit.dart' as _i14;
import '../../presentation/views/auth/splash/auth_splash_cubit.dart' as _i5;
import '../../presentation/views/bottom/bottom_cubit.dart' as _i6;
import '../../presentation/views/chat/chat_cubit.dart' as _i7;
import '../../presentation/views/contacts/contacts_cubit.dart' as _i8;
import '../../presentation/views/message/message_cubit.dart' as _i13;
import '../../presentation/views/search/search_cubit.dart' as _i16;
import '../../presentation/views/settings/settings_cubit.dart' as _i17;
import '../../presentation/views/theme_manager/theme_manager.dart' as _i18;
import '../datasources/firebase/events/analytic_events.dart' as _i3;
import '../datasources/firebase/remote_config/remote_config_manager.dart'
    as _i15;
import '../datasources/local/local_storage.dart' as _i11;
import '../repositories/firebase_auth/firebase_auth_manager.dart' as _i4;
import '../repositories/firebase_firestore/firestore_manager.dart' as _i9;

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
  gh.singleton<_i4.AuthManager>(_i4.AuthManagerImpl());
  gh.singleton<_i5.AuthSplashCubit>(_i5.AuthSplashCubit());
  gh.singleton<_i6.BottomCubit>(_i6.BottomCubit());
  gh.singleton<_i7.ChatCubit>(_i7.ChatCubit());
  gh.singleton<_i8.ContactsCubit>(_i8.ContactsCubit());
  gh.singleton<_i9.FireStoreManager>(_i9.FireStoreManagerImpl());
  gh.singleton<_i10.ForgotPassCubit>(_i10.ForgotPassCubit());
  gh.singleton<_i11.LocalStorage>(_i11.LocalStorageImpl());
  gh.singleton<_i12.LoginCubit>(_i12.LoginCubit());
  gh.singleton<_i13.MessageCubit>(_i13.MessageCubit());
  gh.singleton<_i14.RegisterCubit>(_i14.RegisterCubit());
  gh.singleton<_i15.RemoteConfigService>(_i15.RemoteConfigService());
  gh.singleton<_i16.SearchCubit>(_i16.SearchCubit());
  gh.singleton<_i17.SettingsCubit>(_i17.SettingsCubit());
  gh.singleton<_i18.ThemeManager>(_i18.ThemeManager());
  return getIt;
}
