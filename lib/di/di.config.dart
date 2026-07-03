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

import '../core/network/api_consumer.dart' as _i314;
import '../core/network/dio_module.dart' as _i673;
import '../features/main_layout/home/repair/api/api_client/repair_api_client.dart'
    as _i46;
import '../features/main_layout/home/repair/api/data_source/repair_remote_data_source_impl.dart'
    as _i68;
import '../features/main_layout/home/repair/data/data_source/repair_remote_data_source_contract.dart'
    as _i304;
import '../features/main_layout/home/repair/data/repo/repair_repo_impl.dart'
    as _i34;
import '../features/main_layout/home/repair/domain/repo/repair_repo_contract.dart'
    as _i814;
import '../features/main_layout/home/repair/domain/use_cases/get_issue_type_use_case.dart'
    as _i348;
import '../features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_cubit.dart'
    as _i957;
import '../features/reviews/cubit/reviews_cubit.dart' as _i984;
import '../features/reviews/repositories/review_phone_repository.dart'
    as _i33;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i33.ReviewsRepository>(
      () => _i33.ReviewsRepository(api: gh<_i314.ApiConsumer>()),
    );
    gh.factory<_i46.RepairApiClient>(
      () => _i46.RepairApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i984.PhoneReviewsCubit>(
      () => _i984.PhoneReviewsCubit(repository: gh<_i33.ReviewsRepository>()),
    );
    gh.factory<_i304.RepairRemoteDataSourceContract>(
      () => _i68.RepairRemoteDataSourceImpl(gh<_i46.RepairApiClient>()),
    );
    gh.factory<_i814.RepairRepoContract>(
      () => _i34.RepairRepoImpl(gh<_i304.RepairRemoteDataSourceContract>()),
    );
    gh.factory<_i348.GetIssueTypeUseCase>(
      () => _i348.GetIssueTypeUseCase(gh<_i814.RepairRepoContract>()),
    );
    gh.factory<_i957.IssueTypeCubit>(
      () => _i957.IssueTypeCubit(gh<_i348.GetIssueTypeUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i673.DioModule {}
