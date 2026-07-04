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
import '../features/main_layout/home/repair/api/api_client/repair_api_client.dart'
    as _i740;
import '../features/main_layout/home/repair/api/data_source/repair_remote_data_source_impl.dart'
    as _i1001;
import '../features/main_layout/home/repair/data/data_source/repair_remote_data_source_contract.dart'
    as _i1070;
import '../features/main_layout/home/repair/domain/repo/repair_repo_contract.dart'
    as _i890;
import '../features/main_layout/home/repair/domain/use_cases/get_issue_type_use_case.dart'
    as _i892;
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
    gh.factory<_i892.GetIssueTypeUseCase>(
      () => _i892.GetIssueTypeUseCase(gh<_i890.RepairRepoContract>()),
    );
    gh.factory<_i740.RepairApiClient>(
      () => _i740.RepairApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i826.ReviewsClient>(() => _i826.ReviewsClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i116.ReviewsRepository>(
      () => _i116.ReviewsRepository(client: gh<_i826.ReviewsClient>()),
    );
    gh.factory<_i1070.RepairRemoteDataSourceContract>(
      () => _i1001.RepairRemoteDataSourceImpl(gh<_i740.RepairApiClient>()),
    );
    gh.factory<_i525.PhoneReviewsCubit>(
      () => _i525.PhoneReviewsCubit(repository: gh<_i116.ReviewsRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i326.DioModule {}
