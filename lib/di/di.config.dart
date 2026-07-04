// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/dio_module.dart' as _i326;
import '../features/issue_types/api_client/issue_type_api_client.dart' as _i13;
import '../features/issue_types/cubit/issue_type_cubit.dart' as _i320;
import '../features/issue_types/repositories/issue_type_reposirory.dart'
    as _i261;
import '../features/reviews/cubit/reviews_cubit.dart' as _i525;
import '../features/reviews/repositories/data_source/reviews_client.dart'
    as _i826;
import '../features/reviews/repositories/review_phone_repository.dart' as _i116;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i13.IssueTypeApiClient>(
      () => _i13.IssueTypeApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i826.ReviewsClient>(() => _i826.ReviewsClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i116.ReviewsRepository>(
      () => _i116.ReviewsRepository(client: gh<_i826.ReviewsClient>()),
    );
    gh.lazySingleton<_i261.IssueTypeRepository>(
      () => _i261.IssueTypeRepository(apiClient: gh<_i13.IssueTypeApiClient>()),
    );
    gh.factory<_i525.PhoneReviewsCubit>(
      () => _i525.PhoneReviewsCubit(repository: gh<_i116.ReviewsRepository>()),
    );
    gh.factory<_i320.IssueTypeCubit>(
      () => _i320.IssueTypeCubit(repository: gh<_i261.IssueTypeRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i326.DioModule {}
