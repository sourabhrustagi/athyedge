// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'core/persistent_store.dart' as _i5;
import 'infrastructure/core/register_module.dart' as _i7;
import 'infrastructure/equipments/equipments_repository.dart' as _i6;
import 'presentation/equipments/cubits/loader_cubit.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.LoaderCubit>(() => _i3.LoaderCubit());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i5.PersistentStore>(
      () => _i5.PersistentStoreImpl(get<_i4.SharedPreferences>()));
  gh.factory<_i6.EquipmentRepository>(
      () => _i6.EquipmentRepositoryImpl(get<_i5.PersistentStore>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
