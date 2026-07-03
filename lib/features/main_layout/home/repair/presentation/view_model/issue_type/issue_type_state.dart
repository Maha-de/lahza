// import 'package:equatable/equatable.dart';
// import 'package:lahza/config/base_state/base_state.dart';
// import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';
//
// class IssueTypeStates extends Equatable {
//   final BaseState<List<IssueTypeEntity>> issueTypesState;
//   final List<IssueTypeEntity> filteredIssueTypes;
//   final IssueTypeEntity? selectedIssueType;
//
//   const IssueTypeStates({
//     this.issueTypesState = const BaseState(),
//     this.filteredIssueTypes = const [],
//     this.selectedIssueType,
//   });
//
//   IssueTypeStates copyWith({
//     BaseState<List<IssueTypeEntity>>? issueTypesState,
//     List<IssueTypeEntity>? filteredIssueTypes,
//     IssueTypeEntity? selectedIssueType,
//   }) {
//     return IssueTypeStates(
//       issueTypesState: issueTypesState ?? this.issueTypesState,
//       filteredIssueTypes:
//           filteredIssueTypes ?? this.filteredIssueTypes,
//       selectedIssueType:
//           selectedIssueType ?? this.selectedIssueType,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         issueTypesState,
//         filteredIssueTypes,
//         selectedIssueType,
//       ];
// }