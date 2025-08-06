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
import '../features/data/data_source/remote_data_source/admin_request_type_remote_data_source/admin_request_type_remote_data_source.dart'
    as _i735;
import '../features/data/data_source/remote_data_source/admin_request_type_remote_data_source/admin_request_type_remote_data_source_impl.dart'
    as _i1059;
import '../features/data/data_source/remote_data_source/admin_student_request_remote_data_source/admin_student_request_remote_data_source.dart'
    as _i1058;
import '../features/data/data_source/remote_data_source/admin_student_request_remote_data_source/admin_student_request_remote_data_source_impl.dart'
    as _i143;
import '../features/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i299;
import '../features/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i600;
import '../features/data/data_source/remote_data_source/chat_remote_data_source/chat_remote_data_source.dart'
    as _i638;
import '../features/data/data_source/remote_data_source/chat_remote_data_source/chat_remote_data_source_impl.dart'
    as _i938;
import '../features/data/data_source/remote_data_source/create_remote_data_source/create_remote_data_source.dart'
    as _i940;
import '../features/data/data_source/remote_data_source/create_remote_data_source/create_remote_data_source_impl.dart'
    as _i179;
import '../features/data/data_source/remote_data_source/event_remote_data_source/event_remote_data_source.dart'
    as _i690;
import '../features/data/data_source/remote_data_source/event_remote_data_source/event_remote_data_source_impl.dart'
    as _i469;
import '../features/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart'
    as _i414;
import '../features/data/data_source/remote_data_source/news_remote_data_source/news_remote_data_source_impl.dart'
    as _i3;
import '../features/data/mapper/admin_studetn_request_mapper.dart' as _i548;
import '../features/data/mapper/auth_mapper.dart' as _i1010;
import '../features/data/mapper/event_mapper.dart' as _i68;
import '../features/data/mapper/news_mapper.dart' as _i242;
import '../features/data/mapper/request_type_mapper.dart' as _i703;
import '../features/data/repositories_impl/admin_student_request_repository_impl.dart'
    as _i1064;
import '../features/data/repositories_impl/auth_repository_impl.dart' as _i419;
import '../features/data/repositories_impl/chat_repository_impl.dart' as _i1061;
import '../features/data/repositories_impl/create_user_repository_impl.dart'
    as _i834;
import '../features/data/repositories_impl/event_repository_impl.dart' as _i18;
import '../features/data/repositories_impl/news_repository_impl.dart' as _i809;
import '../features/data/repositories_impl/request_type_repository_impl.dart'
    as _i212;
import '../features/domain/repositories/admin_student_request_repository.dart'
    as _i832;
import '../features/domain/repositories/auth_repository.dart' as _i858;
import '../features/domain/repositories/chat_repository.dart' as _i909;
import '../features/domain/repositories/create_repository.dart' as _i804;
import '../features/domain/repositories/event_repository.dart' as _i329;
import '../features/domain/repositories/new_repository.dart' as _i531;
import '../features/domain/repositories/request_type_repository.dart' as _i80;
import '../features/domain/use_case/admin_student_request_use_case/accept_request_use_case.dart'
    as _i645;
import '../features/domain/use_case/admin_student_request_use_case/create_student_request_use_case.dart'
    as _i292;
import '../features/domain/use_case/admin_student_request_use_case/get_all_accepted_requests_admin_use_case.dart'
    as _i1023;
import '../features/domain/use_case/admin_student_request_use_case/get_all_panding_requests_admin_use_case.dart'
    as _i185;
import '../features/domain/use_case/admin_student_request_use_case/get_all_pending_requests_admin_by_Id_use_case.dart'
    as _i279;
import '../features/domain/use_case/admin_student_request_use_case/get_all_regicted_requests_admin_use_case.dart'
    as _i968;
import '../features/domain/use_case/admin_student_request_use_case/get_all_request_type_student_use_case.dart'
    as _i715;
import '../features/domain/use_case/admin_student_request_use_case/get_all_requests_type_admin_use_case.dart'
    as _i485;
import '../features/domain/use_case/admin_student_request_use_case/regicted_request_use_case.dart'
    as _i95;
import '../features/domain/use_case/auth_use_case/delete_profile_use_case.dart'
    as _i553;
import '../features/domain/use_case/auth_use_case/get_profile_use_case.dart'
    as _i454;
import '../features/domain/use_case/auth_use_case/login_use_case.dart' as _i434;
import '../features/domain/use_case/auth_use_case/logout_use_case.dart'
    as _i207;
import '../features/domain/use_case/auth_use_case/update_profile_use_case.dart'
    as _i284;
import '../features/domain/use_case/chat_use_case/answer_questions_use_case.dart'
    as _i723;
import '../features/domain/use_case/chat_use_case/get_all_questions_use_case.dart'
    as _i392;
import '../features/domain/use_case/create_use_case/create_single_use_case.dart'
    as _i721;
import '../features/domain/use_case/create_use_case/upload_excal_use_case.dart'
    as _i735;
import '../features/domain/use_case/event_use_case/create_event_use_case.dart'
    as _i869;
import '../features/domain/use_case/event_use_case/delete_event_use_case.dart'
    as _i724;
import '../features/domain/use_case/event_use_case/get_all_event_use_case.dart'
    as _i1057;
import '../features/domain/use_case/news_use_case/create_news_use_case.dart'
    as _i691;
import '../features/domain/use_case/news_use_case/delete_news_use_case.dart'
    as _i837;
import '../features/domain/use_case/news_use_case/get_all_news_use_case.dart'
    as _i872;
import '../features/domain/use_case/request_type_use_case/add_request_type_use_case.dart'
    as _i363;
import '../features/domain/use_case/request_type_use_case/delete_request_type_use_case.dart'
    as _i577;
import '../features/domain/use_case/request_type_use_case/get_all_request_type_use_case.dart'
    as _i986;
import '../features/domain/use_case/request_type_use_case/update_request_type_use_case.dart'
    as _i284;
import '../features/presentation/home/ad_home/event_tab/view_model/admin_event_cubit/admin_event_cubit.dart'
    as _i502;
import '../features/presentation/home/ad_home/event_tab/view_model/create_event/create_event_cubit.dart'
    as _i990;
import '../features/presentation/home/ad_home/menu_tab/accepted_request/view_model/accepted_request_cubit.dart'
    as _i998;
import '../features/presentation/home/ad_home/menu_tab/create_single_user/view_model/create_single_user_cubit.dart'
    as _i220;
import '../features/presentation/home/ad_home/menu_tab/manage_request/view_model/add_request_type/add_request_type_cubit.dart'
    as _i552;
import '../features/presentation/home/ad_home/menu_tab/manage_request/view_model/mangent_rquest_type/mangent_rquest_type_cubit.dart'
    as _i43;
import '../features/presentation/home/ad_home/menu_tab/manage_request/view_model/update_request_type/update_request_type_cubit.dart'
    as _i634;
import '../features/presentation/home/ad_home/menu_tab/rejected_request/view_model/regiected_request_cubit.dart'
    as _i318;
import '../features/presentation/home/ad_home/menu_tab/upload_sheet/view_model/upload_sheet_cubit.dart'
    as _i365;
import '../features/presentation/home/ad_home/news_tab/view_model/add_news_admin/add_news_admin_cubit.dart'
    as _i907;
import '../features/presentation/home/ad_home/news_tab/view_model/admin_news_cubit.dart'
    as _i175;
import '../features/presentation/home/ad_home/profile/view_model/admin_profile_cubit.dart'
    as _i484;
import '../features/presentation/home/ad_home/requests/view_model/confirem_request/confirm_request_cubit.dart'
    as _i325;
import '../features/presentation/home/ad_home/requests/view_model/regiect_request_view_model/regiect_request_cubit.dart'
    as _i73;
import '../features/presentation/home/ad_home/requests/view_model/reject_reason/reject_reason_cubit.dart'
    as _i425;
import '../features/presentation/home/st_home/event/view_model/event_cubit.dart'
    as _i612;
import '../features/presentation/home/st_home/home_tab/view_model/st_home_tab_cubit.dart'
    as _i947;
import '../features/presentation/home/st_home/menua/chat/view/chat_cubit.dart'
    as _i977;
import '../features/presentation/home/st_home/menua/request_student/view_model/request_studnet_cubit.dart'
    as _i626;
import '../features/presentation/home/st_home/news/view_model/news_cubit.dart'
    as _i824;
import '../features/presentation/home/st_home/profile/view_model/student_profile_cubit.dart'
    as _i973;
import '../features/presentation/home/st_home/st_request/view_model/confirm_st_request/confirm_st_request_cubit.dart'
    as _i313;
import '../features/presentation/home/st_home/st_request/view_model/st_request/st_request_cubit.dart'
    as _i416;
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
    gh.factory<_i703.RequestTypeMapper>(() => _i703.RequestTypeMapperImpl());
    gh.factory<_i242.NewsMapper>(() => _i242.NewsMapperImpl());
    gh.factory<_i68.EventMapper>(() => _i68.EventMapperImpl());
    gh.factory<_i284.ApiManger>(() => _i284.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i283.CachingDataSecureStorage>(
        () => _i987.SecureStorageFunction());
    gh.factory<_i548.AdminStudentRequestMapper>(
        () => _i548.AdminStudentRequestMapperImpl());
    gh.factory<_i940.CreateRemoteDataSource>(
        () => _i179.CreateRemoteDataSourceImpl(gh<_i284.ApiManger>()));
    gh.factory<_i804.CreateRepository>(
        () => _i834.CreateRepositoryImpl(gh<_i940.CreateRemoteDataSource>()));
    gh.factory<_i638.ChatRemoteDataSource>(
        () => _i938.ChatRemoteDataSourceImpl(gh<_i284.ApiManger>()));
    gh.factory<_i735.AdminRequestTypeRemoteDataSource>(
        () => _i1059.AdminRequestTypeRemoteDataSourceImpl(
              gh<_i284.ApiManger>(),
              gh<_i703.RequestTypeMapper>(),
            ));
    gh.factory<_i1058.AdminStudentRequestRemoteDataSource>(
        () => _i143.AdminStudentRequestRemoteDataSourceImpl(
              gh<_i284.ApiManger>(),
              gh<_i548.AdminStudentRequestMapper>(),
            ));
    gh.factory<_i721.CreateSingleUseCase>(
        () => _i721.CreateSingleUseCase(gh<_i804.CreateRepository>()));
    gh.factory<_i735.UploadExcalUseCase>(
        () => _i735.UploadExcalUseCase(gh<_i804.CreateRepository>()));
    gh.factory<_i690.EventRemoteDataSource>(
        () => _i469.EventRemoteDataSourceImpl(
              gh<_i284.ApiManger>(),
              gh<_i68.EventMapper>(),
            ));
    gh.factory<_i299.AuthRemoteDataSource>(() => _i600.AuthRemoteDataSourceImpl(
          gh<_i284.ApiManger>(),
          gh<_i1010.AuthMapper>(),
        ));
    gh.factory<_i365.UploadSheetCubit>(
        () => _i365.UploadSheetCubit(gh<_i735.UploadExcalUseCase>()));
    gh.factory<_i948.AuthOfflineDataSource>(
        () => _i162.AuthOfflineDataSourceImpl(
              gh<_i283.CachingDataSecureStorage>(),
              gh<_i1010.AuthMapper>(),
            ));
    gh.factory<_i414.NewsRemoteDataSource>(() => _i3.NewsRemoteDataSourceImpl(
          gh<_i284.ApiManger>(),
          gh<_i242.NewsMapper>(),
        ));
    gh.factory<_i909.ChatRepository>(() => _i1061.ChatRepositoryImpl(
        chatRemoteDataSource: gh<_i638.ChatRemoteDataSource>()));
    gh.factory<_i858.AuthRepository>(() => _i419.AuthRepositoryImpl(
          gh<_i299.AuthRemoteDataSource>(),
          gh<_i948.AuthOfflineDataSource>(),
        ));
    gh.factory<_i220.CreateSingleUserCubit>(
        () => _i220.CreateSingleUserCubit(gh<_i721.CreateSingleUseCase>()));
    gh.factory<_i434.LoginUseCase>(
        () => _i434.LoginUseCase(gh<_i858.AuthRepository>()));
    gh.factory<_i553.DeleteProfileUseCase>(
        () => _i553.DeleteProfileUseCase(gh<_i858.AuthRepository>()));
    gh.factory<_i284.UpdateProfileUseCase>(
        () => _i284.UpdateProfileUseCase(gh<_i858.AuthRepository>()));
    gh.factory<_i832.AdminStudentRequestRepository>(() =>
        _i1064.AdminStudentRequestRepositoryImpl(
            adminStudentRequestRemoteDataSource:
                gh<_i1058.AdminStudentRequestRemoteDataSource>()));
    gh.factory<_i329.EventRepository>(
        () => _i18.EventRepositoryImpl(gh<_i690.EventRemoteDataSource>()));
    gh.factory<_i723.AnswerQuestionsUseCase>(() => _i723.AnswerQuestionsUseCase(
        chatRepository: gh<_i909.ChatRepository>()));
    gh.factory<_i392.GetAllQuestionsUseCase>(() => _i392.GetAllQuestionsUseCase(
        chatRepository: gh<_i909.ChatRepository>()));
    gh.factory<_i531.NewRepository>(() => _i809.NewsRepositoryImpl(
        newsRemoteDataSource: gh<_i414.NewsRemoteDataSource>()));
    gh.factory<_i80.RequestTypeRepository>(() =>
        _i212.RequestTypeRepositoryImpl(
            gh<_i735.AdminRequestTypeRemoteDataSource>()));
    gh.factory<_i363.AddRequestTypeUseCase>(() => _i363.AddRequestTypeUseCase(
        requestTypeRepository: gh<_i80.RequestTypeRepository>()));
    gh.factory<_i577.DeleteRequestTypeUseCase>(() =>
        _i577.DeleteRequestTypeUseCase(
            requestTypeRepository: gh<_i80.RequestTypeRepository>()));
    gh.factory<_i986.GetAllRequestTypeUseCase>(() =>
        _i986.GetAllRequestTypeUseCase(
            requestTypeRepository: gh<_i80.RequestTypeRepository>()));
    gh.factory<_i284.UpdateRequestTypeUseCase>(() =>
        _i284.UpdateRequestTypeUseCase(
            requestTypeRepository: gh<_i80.RequestTypeRepository>()));
    gh.factory<_i1023.GetAllAcceptedRequestsAdminUseCase>(() =>
        _i1023.GetAllAcceptedRequestsAdminUseCase(
            gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i292.CreateStudentRequestUseCase>(() =>
        _i292.CreateStudentRequestUseCase(
            gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i485.GetAllRequestsTypeAdminUseCase>(() =>
        _i485.GetAllRequestsTypeAdminUseCase(
            gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i626.RequestStudnetCubit>(() =>
        _i626.RequestStudnetCubit(gh<_i485.GetAllRequestsTypeAdminUseCase>()));
    gh.factory<_i240.LoginCubit>(
        () => _i240.LoginCubit(loginUseCase:  gh<_i434.LoginUseCase>()));
    gh.factory<_i454.GetProfileUseCase>(() =>
        _i454.GetProfileUseCase(authRepository: gh<_i858.AuthRepository>()));
    gh.factory<_i207.LogoutUseCase>(
        () => _i207.LogoutUseCase(authRepository: gh<_i858.AuthRepository>()));
    gh.factory<_i484.AdminProfileCubit>(() => _i484.AdminProfileCubit(
          gh<_i454.GetProfileUseCase>(),
          gh<_i553.DeleteProfileUseCase>(),
          gh<_i284.UpdateProfileUseCase>(),
        ));
    gh.factory<_i973.StudentProfileCubit>(() => _i973.StudentProfileCubit(
          gh<_i454.GetProfileUseCase>(),
          gh<_i553.DeleteProfileUseCase>(),
          gh<_i284.UpdateProfileUseCase>(),
        ));
    gh.factory<_i869.CreateEventUseCase>(() =>
        _i869.CreateEventUseCase(eventRepository: gh<_i329.EventRepository>()));
    gh.factory<_i724.DeleteEventUseCase>(() =>
        _i724.DeleteEventUseCase(eventRepository: gh<_i329.EventRepository>()));
    gh.factory<_i1057.GetAllEventUseCase>(() => _i1057.GetAllEventUseCase(
        eventRepository: gh<_i329.EventRepository>()));
    gh.factory<_i998.AcceptedRequestCubit>(() => _i998.AcceptedRequestCubit(
        gh<_i1023.GetAllAcceptedRequestsAdminUseCase>()));
    gh.factory<_i990.CreateEventCubit>(
        () => _i990.CreateEventCubit(gh<_i869.CreateEventUseCase>()));
    gh.factory<_i313.ConfirmStRequestCubit>(() =>
        _i313.ConfirmStRequestCubit(gh<_i292.CreateStudentRequestUseCase>()));
    gh.factory<_i634.UpdateRequestTypeCubit>(() =>
        _i634.UpdateRequestTypeCubit(gh<_i284.UpdateRequestTypeUseCase>()));
    gh.factory<_i691.CreateNewsUseCase>(() =>
        _i691.CreateNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i837.DeleteNewsUseCase>(() =>
        _i837.DeleteNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i872.GetAllNewsUseCase>(() =>
        _i872.GetAllNewsUseCase(newsRepository: gh<_i531.NewRepository>()));
    gh.factory<_i612.EventCubit>(
        () => _i612.EventCubit(gh<_i1057.GetAllEventUseCase>()));
    gh.factory<_i977.ChatCubit>(() => _i977.ChatCubit(
          gh<_i392.GetAllQuestionsUseCase>(),
          gh<_i723.AnswerQuestionsUseCase>(),
        ));
    gh.factory<_i552.AddRequestTypeCubit>(
        () => _i552.AddRequestTypeCubit(gh<_i363.AddRequestTypeUseCase>()));
    gh.factory<_i645.AcceptRequestUseCase>(() => _i645.AcceptRequestUseCase(
        adminStudentRequestRepository:
            gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i185.GetAllPendingRequestsAdminUseCase>(() =>
        _i185.GetAllPendingRequestsAdminUseCase(
            adminStudentRequestRepository:
                gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i279.GetAllPendingRequestsAdminByIdUseCase>(() =>
        _i279.GetAllPendingRequestsAdminByIdUseCase(
            adminStudentRequestRepository:
                gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i968.GetAllRejectedRequestsAdminUseCase>(() =>
        _i968.GetAllRejectedRequestsAdminUseCase(
            adminStudentRequestRepository:
                gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i95.RegictedRequestUseCase>(() => _i95.RegictedRequestUseCase(
        adminStudentRequestRepository:
            gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i715.GetAllRequestTypeStudentUseCase>(() =>
        _i715.GetAllRequestTypeStudentUseCase(
            adminStudentRequestRepository:
                gh<_i832.AdminStudentRequestRepository>()));
    gh.factory<_i43.MangentRquestTypeCubit>(() => _i43.MangentRquestTypeCubit(
          gh<_i986.GetAllRequestTypeUseCase>(),
          gh<_i577.DeleteRequestTypeUseCase>(),
        ));
    gh.factory<_i416.StRequestCubit>(() =>
        _i416.StRequestCubit(gh<_i715.GetAllRequestTypeStudentUseCase>()));
    gh.factory<_i318.RegiectedRequestCubit>(() => _i318.RegiectedRequestCubit(
        gh<_i968.GetAllRejectedRequestsAdminUseCase>()));
    gh.factory<_i502.AdminEventCubit>(() => _i502.AdminEventCubit(
          gh<_i1057.GetAllEventUseCase>(),
          gh<_i724.DeleteEventUseCase>(),
        ));
    gh.factory<_i824.NewsCubit>(
        () => _i824.NewsCubit(gh<_i872.GetAllNewsUseCase>()));
    gh.factory<_i175.AdminNewsCubit>(() => _i175.AdminNewsCubit(
          gh<_i872.GetAllNewsUseCase>(),
          gh<_i837.DeleteNewsUseCase>(),
          gh<_i691.CreateNewsUseCase>(),
        ));
    gh.factory<_i425.RejectReasonCubit>(
        () => _i425.RejectReasonCubit(gh<_i95.RegictedRequestUseCase>()));
    gh.factory<_i947.StHomeTabCubit>(() => _i947.StHomeTabCubit(
          gh<_i1057.GetAllEventUseCase>(),
          gh<_i872.GetAllNewsUseCase>(),
        ));
    gh.factory<_i907.AddNewsAdminCubit>(
        () => _i907.AddNewsAdminCubit(gh<_i691.CreateNewsUseCase>()));
    gh.factory<_i73.RegiectRequestCubit>(() => _i73.RegiectRequestCubit(
        gh<_i185.GetAllPendingRequestsAdminUseCase>()));
    gh.factory<_i325.ConfirmRequestCubit>(() => _i325.ConfirmRequestCubit(
          gh<_i279.GetAllPendingRequestsAdminByIdUseCase>(),
          gh<_i95.RegictedRequestUseCase>(),
          gh<_i645.AcceptRequestUseCase>(),
        ));
    return this;
  }
}

class _$DioProvider extends _i152.DioProvider {}
