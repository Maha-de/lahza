import 'package:equatable/equatable.dart';
import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';

sealed class IssueTypeEvent extends Equatable {
  const IssueTypeEvent();

  @override
  List<Object?> get props => [];
}

class GetIssueTypesEvent extends IssueTypeEvent {
  const GetIssueTypesEvent();
}

class SelectIssueTypeEvent extends IssueTypeEvent {
  final IssueTypeEntity issueType;

  const SelectIssueTypeEvent(this.issueType);

  @override
  List<Object?> get props => [issueType];
}

class SearchIssueTypesEvent extends IssueTypeEvent {
  final String query;

  const SearchIssueTypesEvent(this.query);

  @override
  List<Object?> get props => [query];
}