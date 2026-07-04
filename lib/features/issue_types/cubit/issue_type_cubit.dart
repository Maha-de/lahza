import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/issue_types/cubit/issue_type_state.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_model.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_response.dart';
import 'package:lahza/features/issue_types/repositories/issue_type_reposirory.dart';

@Injectable()
class IssueTypeCubit extends Cubit<IssueTypeState> {
  final IssueTypeRepository repository;

  IssueTypeCubit({required this.repository}) : super(IssueTypeInitial());

  List<IssueTypeModel> _allIssueTypes = [];

  IssueTypeModel? selectedIssue;

  Timer? _debounce;

  Future<void> fetchIssueTypes() async {
    emit(IssueTypeLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getIssueTypes(),
    );

    if (response is SuccessBaseResponse<IssueTypesResponse>) {
      final model = response.data;

      _allIssueTypes = model.data ?? [];

      emit(IssueTypeSuccess(data: _allIssueTypes));
    } else if (response is ErrorBaseResponse<IssueTypesResponse>) {
      emit(IssueTypeError(errorModel: response.errorModel));
    }
  }

  void selectIssue(IssueTypeModel issue) {
    selectedIssue = issue;

    if (state is IssueTypeSuccess) {
      emit(IssueTypeSuccess(data: (state as IssueTypeSuccess).data));
    }
  }

  void search(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (state is! IssueTypeSuccess) return;

      if (query.trim().isEmpty) {
        emit(IssueTypeSuccess(data: _allIssueTypes));
        return;
      }

      final result = _allIssueTypes.where((issue) {
        return (issue.label ?? '').toLowerCase().contains(
              query.toLowerCase(),
            ) ||
            (issue.value ?? '').toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(IssueTypeSuccess(data: result));
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
