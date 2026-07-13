// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/api_interceptors.dart' as _i319;
import '../core/network/dio_module.dart' as _i326;
import '../core/services/facebook_auth_service.dart' as _i317;
import '../core/services/google_auth_service.dart' as _i752;
import '../core/services/image_uploader/multi_part_services.dart' as _i574;
import '../core/services/location_service.dart' as _i848;
import '../core/services/secure_storage_service.dart' as _i214;
import '../core/services/storge_module.dart' as _i780;
import '../features/auth/api_client/auth_api_client.dart' as _i674;
import '../features/auth/cubit/complete_profile/complete_profile_cubit.dart'
    as _i228;
import '../features/auth/cubit/login/login_cubit.dart' as _i439;
import '../features/auth/cubit/signup/signup_cubit.dart' as _i87;
import '../features/auth/repositories/auth_repository.dart' as _i224;
import '../features/device_info/api_client/device_info_api_client.dart'
    as _i973;
import '../features/device_info/cubit/device_info_cubit.dart' as _i487;
import '../features/device_info/repositories/device_info_repoditory.dart'
    as _i464;
import '../features/issue_types/api_client/issue_type_api_client.dart' as _i13;
import '../features/issue_types/cubit/issue_type_cubit.dart' as _i320;
import '../features/issue_types/repositories/issue_type_reposirory.dart'
    as _i261;
import '../features/offers/api_client/offers_client.dart' as _i435;
import '../features/offers/cubit/offers_cubit.dart' as _i448;
import '../features/offers/repositories/offers_repository.dart' as _i896;
import '../features/orders/api_client/my_orders_client.dart' as _i418;
import '../features/orders/cubit/my_orders_cubit.dart' as _i655;
import '../features/orders/repositories/my_orders_repository.dart' as _i647;
import '../features/reviews/api_client/reviews_client.dart' as _i236;
import '../features/reviews/cubit/product_specs_cubit.dart' as _i651;
import '../features/reviews/cubit/review_product_details_cubit.dart' as _i827;
import '../features/reviews/cubit/reviews_cubit.dart' as _i525;
import '../features/reviews/repositories/review_phone_repository.dart' as _i117;
import 'services_module.dart' as _i205;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final servicesModule = _$ServicesModule();
    final dioModule = _$DioModule();
    gh.singleton<_i574.MultipartService>(() => _i574.MultipartService());
    gh.lazySingleton<_i848.LocationService>(() => _i848.LocationService());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage(),
    );
    gh.lazySingleton<_i116.GoogleSignIn>(() => servicesModule.googleSignIn());
    gh.lazySingleton<_i317.FacebookAuthService>(
      () => servicesModule.facebookAuthService(),
    );
    gh.lazySingleton<_i752.GoogleAuthService>(
      () => _i752.GoogleAuthService(gh<_i116.GoogleSignIn>()),
    );
    gh.lazySingleton<_i214.SecureStorageService>(
      () => _i214.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i319.ApiInterceptor>()),
    );
    gh.lazySingleton<_i674.AuthApiClient>(
      () => _i674.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i973.DeviceInfoApiClient>(
      () => _i973.DeviceInfoApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i13.IssueTypeApiClient>(
      () => _i13.IssueTypeApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i435.OffersClient>(() => _i435.OffersClient(gh<_i361.Dio>()));
    gh.factory<_i418.MyOrdersClient>(
      () => _i418.MyOrdersClient(gh<_i361.Dio>()),
    );
    gh.factory<_i236.ReviewsClient>(() => _i236.ReviewsClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i647.MyOrdersRepository>(
      () => _i647.MyOrdersRepository(client: gh<_i418.MyOrdersClient>()),
    );
    gh.lazySingleton<_i464.DeviceInfoRepoditory>(
      () => _i464.DeviceInfoRepoditory(
        apiClient: gh<_i973.DeviceInfoApiClient>(),
        multipartService: gh<_i574.MultipartService>(),
      ),
    );
    gh.factory<_i487.DeviceInfoCubit>(
      () => _i487.DeviceInfoCubit(gh<_i464.DeviceInfoRepoditory>()),
    );
    gh.lazySingleton<_i896.OffersRepository>(
      () => _i896.OffersRepository(client: gh<_i435.OffersClient>()),
    );
    gh.lazySingleton<_i224.AuthRepository>(
      () => _i224.AuthRepository(
        gh<_i674.AuthApiClient>(),
        gh<_i214.SecureStorageService>(),
      ),
    );
    gh.factory<_i87.RegisterCubit>(
      () => _i87.RegisterCubit(repository: gh<_i224.AuthRepository>()),
    );
    gh.factory<_i448.OffersCubit>(
      () => _i448.OffersCubit(repository: gh<_i896.OffersRepository>()),
    );
    gh.lazySingleton<_i117.ReviewsRepository>(
      () => _i117.ReviewsRepository(client: gh<_i236.ReviewsClient>()),
    );
    gh.factory<_i655.MyOrdersCubit>(
      () => _i655.MyOrdersCubit(repository: gh<_i647.MyOrdersRepository>()),
    );
    gh.lazySingleton<_i261.IssueTypeRepository>(
      () => _i261.IssueTypeRepository(apiClient: gh<_i13.IssueTypeApiClient>()),
    );
    gh.factory<_i228.CompleteProfileCubit>(
      () => _i228.CompleteProfileCubit(
        repository: gh<_i224.AuthRepository>(),
        locationService: gh<_i848.LocationService>(),
      ),
    );
    gh.factory<_i439.LoginCubit>(
      () => _i439.LoginCubit(
        repository: gh<_i224.AuthRepository>(),
        facebookAuthService: gh<_i317.FacebookAuthService>(),
      ),
    );
    gh.factory<_i525.PhoneReviewsCubit>(
      () => _i525.PhoneReviewsCubit(repository: gh<_i117.ReviewsRepository>()),
    );
    gh.factory<_i651.ProductsSpecsCubit>(
      () => _i651.ProductsSpecsCubit(gh<_i117.ReviewsRepository>()),
    );
    gh.factory<_i827.ReviewProductDetailsCubit>(
      () => _i827.ReviewProductDetailsCubit(gh<_i117.ReviewsRepository>()),
    );
    gh.factory<_i320.IssueTypeCubit>(
      () => _i320.IssueTypeCubit(repository: gh<_i261.IssueTypeRepository>()),
    );
    return this;
  }
}

class _$StorageModule extends _i780.StorageModule {}

class _$ServicesModule extends _i205.ServicesModule {}

class _$DioModule extends _i326.DioModule {}
