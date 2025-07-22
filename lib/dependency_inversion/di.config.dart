// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/caching/secure_storge/caching_Data.dart' as _i283;
import '../core/caching/secure_storge/secure_storage.dart' as _i987;
import '../core/routes/app_page_route_provider.dart' as _i359;
import '../features/data/api/api_manger.dart' as _i284;
import '../features/data/api/network_factory.dart' as _i152;
import '../features/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart'
    as _i948;
import '../features/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i162;
import '../features/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i299;
import '../features/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i600;
import '../features/data/data_source/remote_data_source/event_remote_data_source/event_remote_data_source.dart'
    as _i690;
import '../features/data/data_source/remote_data_source/event_remote_data_source/event_remote_data_source_impl.dart'
    as _i469;
import '../features/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart'
    as _i414;
import '../features/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source_impl.dart'
    as _i3;
import '../features/data/mapper/auth_mapper.dart' as _i1010;
import '../features/data/mapper/event_mapper.dart' as _i68;
import '../features/data/mapper/news_mapper.dart' as _i242;
import '../features/data/repositories_impl/auth_repository_impl.dart' as _i419;
import '../features/data/repositories_impl/event_repository_impl.dart' as _i18;
import '../features/data/repositories_impl/news_repository_impl.dart' as _i809;
import '../features/domain/repositories/auth_repository.dart' as _i858;
import '../features/domain/repositories/event_repository.dart' as _i329;
import '../features/domain/repositories/new_repository.dart' as _i531;
import '../features/domain/use_case/auth_use_case/login_use_case.dart' as _i434;
import '../features/domain/use_case/event_use_case/get_all_event_use_case.dart'
    as _i1057;
import '../features/domain/use_case/news_use_case/create_news_use_case.dart'
    as _i691;
import '../features/domain/use_case/news_use_case/delete_news_use_case.dart'
    as _i837;
import '../features/domain/use_case/news_use_case/get_all_news_use_case.dart'
    as _i872;
import '../features/presentation/home/ad_home/news_tab/view_model/add_news_admin/add_news_admin_cubit.dart'
    as _i907;
import '../features/presentation/home/ad_home/news_tab/view_model/admin_news_cubit.dart'
    as _i175;
import '../features/presentation/home/st_home/home_tab/view_model/st_home_tab_cubit.dart'
    as _i947;
import '../features/presentation/login/view_model/login_cubit.dart' as _i240;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.singleton<_i359.AppConfigProvider>(() => _i359.AppConfigProvider());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i361.LogInterceptor>(() => dioProvider.providePretty());
    gh.lazySingleton<_i152.AppInterceptors>(() => _i152.AppInterceptors());
    gh.factory<_i1010.AuthMapper>(() => _i1010.AuthMapperImpl());
    gh.factory<_i242.NewsMapper>(() => _i242.NewsMapperImpl());
    gh.factory<_i68.EventMapper>(() => _i68.EventMapperImpl());
    gh.factory<_i284.ApiManger>(() => _i284.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i283.CachingDataSecureStorage>(
        () => _i987.SecureStorageFunction());
    gh.factory<_i690.EventRemoteDataSource>(
        () => _i469.EventRemoteDataSourceImpl(
              gh<_i284.ApiManger>(),
              gh<_i68.EventMapper>(),
            ));
    gh.factory<_i299.AuthRemoteDataSource>(() => _i600.AuthRemoteDataSourceImpl(
          gh<_i284.ApiManger>(),
          gh<_i1010.AuthMapper>(),
        ));
    gh.factory<_i948.AuthOfflineDataSource>(
        () => _i162.AuthOfflineDataSourceImpl(
              gh<_i283.CachingDataSecureStorage>(),
              gh<_i1010.AuthMapper>(),
            ));
    gh.factory<_i414.NewsRemoteDataSource>(() => _i3.NewsRemoteDataSourceImpl(
          gh<_i284.ApiManger>(),
          gh<_i242.NewsMapper>(),
        ));
    gh.factory<_i858.AuthRepository>(() => _i419.AuthRepositoryImpl(
          gh<_i299.AuthRemoteDataSource>(),
          gh<_i948.AuthOfflineDataSource>(),
        ));
    gh.factory<_i434.LoginUseCase>(
        () => _i434.LoginUseCase(gh<_i858.AuthRepository>()));
    gh.factory<_i329.EventRepository>(
        () => _i18.EventRepositoryImpl(gh<_i690.EventRemoteDataSource>()));
    gh.factory<_i531.NewRepository>(() => _i809.NewsRepositoryImpl(
        newsRemoteDataSource: gh<_i414.NewsRemoteDataSource>()));
    gh.factory<_i240.LoginCubit>(
        () => _i240.LoginCubit(gh<_i434.LoginUseCase>()));
    gh.factory<_i1057.GetAllEventUseCase>(() => _i1057.GetAllEventUseCase(
        eventRepository: gh<_i329.EventRepository>()));
    gh.factory<_i872.GetAllNewsUseCase>(() =>
        _i872.GetAllNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i691.CreateNewsUseCase>(() =>
        _i691.CreateNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i837.DeleteNewsUseCase>(() =>
        _i837.DeleteNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i175.AdminNewsCubit>(() => _i175.AdminNewsCubit(
          gh<_i872.GetAllNewsUseCase>(),
          gh<_i837.DeleteNewsUseCase>(),
          gh<_i691.CreateNewsUseCase>(),
        ));
    gh.factory<_i947.StHomeTabCubit>(() => _i947.StHomeTabCubit(
          gh<_i1057.GetAllEventUseCase>(),
          gh<_i872.GetAllNewsUseCase>(),
        ));
    gh.factory<_i907.AddNewsAdminCubit>(
        () => _i907.AddNewsAdminCubit(gh<_i691.CreateNewsUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i152.DioProvider {}
