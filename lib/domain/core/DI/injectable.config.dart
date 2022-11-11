// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i9;
import '../../../application/home/home_bloc.dart' as _i10;
import '../../../application/hot_and_new/hot_and_new_bloc.dart' as _i11;
import '../../../application/search/search_bloc.dart' as _i12;
import '../../../infrastructure/home/home_repository.dart' as _i6;
import '../../../infrastructure/hot_and_new/hot_and_new_impl.dart' as _i4;
import '../../../infrastructure/search/search_implt.dart' as _i8;
import '../../home/i_home_repo.dart' as _i5;
import '../../hot_and_new_resp/hot_and_new_service.dart' as _i3;
import '../../search/search_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplementation());
  gh.lazySingleton<_i5.IHome>(() => _i6.HomeRepository());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SerachImplt());
  gh.factory<_i9.FastLaughBloc>(() => _i9.FastLaughBloc(get<_i5.IHome>()));
  gh.factory<_i10.HomeBloc>(() => _i10.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i11.HotAndNewBloc>(
      () => _i11.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
        get<_i5.IHome>(),
        get<_i7.SearchService>(),
      ));
  return get;
}
