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
    as _i7;
import '../../presentation/views/auth/login/login_cubit.dart' as _i9;
import '../../presentation/views/auth/register/register_cubit.dart' as _i11;
import '../../presentation/views/bottom/bottom_cubit.dart' as _i4;
import '../../presentation/views/chat/chat_cubit.dart' as _i5;
import '../../presentation/views/message/message_cubit.dart' as _i10;
import '../../presentation/views/search/search_cubit.dart' as _i13;
import '../../presentation/views/theme_manager/theme_manager.dart' as _i14;
import '../datasources/firebase/events/analytic_events.dart' as _i3;
import '../datasources/firebase/remote_config/remote_config_manager.dart'
    as _i12;
import '../datasources/local/local_storage.dart' as _i8;
import '../repositories/firestore/firestore_manager.dart' as _i6;

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
  gh.singleton<_i6.FireStoreManager>(_i6.FireStoreManagerImpl());
  gh.singleton<_i7.ForgotPassCubit>(_i7.ForgotPassCubit());
  gh.singleton<_i8.LocalStorage>(_i8.LocalStorageImpl());
  gh.singleton<_i9.LoginCubit>(_i9.LoginCubit());
  gh.singleton<_i10.MessageCubit>(_i10.MessageCubit());
  gh.singleton<_i11.RegisterCubit>(_i11.RegisterCubit());
  gh.singleton<_i12.RemoteConfigService>(_i12.RemoteConfigService());
  gh.singleton<_i13.SearchCubit>(_i13.SearchCubit());
  gh.singleton<_i14.ThemeManager>(_i14.ThemeManager());
  return getIt;
}
