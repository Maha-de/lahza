// import 'dart:async';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:lahza/config/base_response/base_response.dart';
// import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';
// import 'package:lahza/features/main_layout/home/repair/domain/use_cases/get_issue_type_use_case.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_events.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_state.dart';
//
// @injectable
// class IssueTypeCubit extends Cubit<IssueTypeStates> {
//   IssueTypeCubit(this._getIssueTypeUseCase)
//       : super(const IssueTypeStates());
//
//   final GetIssueTypeUseCase _getIssueTypeUseCase;
//
//   Timer? _debounce;
//
//   Future<void> doEvent(IssueTypeEvent event) async {
//     switch (event) {
//       case GetIssueTypesEvent():
//         return _getIssueTypes();
//
//       case SelectIssueTypeEvent():
//         _selectIssue(event.issueType);
//         return;
//
//       case SearchIssueTypesEvent():
//         _search(event.query);
//         return;
//     }
//   }
//
//   Future<void> _getIssueTypes() async {
//     emit(
//       state.copyWith(
//         issueTypesState: state.issueTypesState.copyWith(
//           isLoading: true,
//           errorMessage: null,
//         ),
//       ),
//     );
//
//     final response = await _getIssueTypeUseCase();
//
//     switch (response) {
//       case SuccessBaseResponse<List<IssueTypeEntity>>():
//         emit(
//           state.copyWith(
//             issueTypesState: state.issueTypesState.copyWith(
//               isLoading: false,
//               data: response.data,
//             ),
//             filteredIssueTypes: response.data,
//           ),
//         );
//
//       case ErrorBaseResponse<List<IssueTypeEntity>>():
//         emit(
//           state.copyWith(
//             issueTypesState: state.issueTypesState.copyWith(
//               isLoading: false,
//               errorMessage: response.errorMessage,
//             ),
//           ),
//         );
//     }
//   }
//
//   void _selectIssue(IssueTypeEntity issue) {
//     emit(
//       state.copyWith(
//         selectedIssueType: issue,
//       ),
//     );
//   }
//
//   void _search(String query) {
//     _debounce?.cancel();
//
//     _debounce = Timer(
//       const Duration(milliseconds: 400),
//       () {
//         if (query.trim().isEmpty) {
//           emit(
//             state.copyWith(
//               filteredIssueTypes:
//                   state.issueTypesState.data ?? [],
//             ),
//           );
//           return;
//         }
//
//         final filtered =
//             (state.issueTypesState.data ?? [])
//                 .where(
//                   (element) =>
//                       element.label
//                           .toLowerCase()
//                           .contains(query.toLowerCase()) ||
//                       element.value
//                           .toLowerCase()
//                           .contains(query.toLowerCase()),
//                 )
//                 .toList();
//
//         emit(
//           state.copyWith(
//             filteredIssueTypes: filtered,
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Future<void> close() {
//     _debounce?.cancel();
//     return super.close();
//   }
// }