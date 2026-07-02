import 'package:equatable/equatable.dart';

class IssueTypeEntity extends Equatable {
  final String value;
  final String label;

  const IssueTypeEntity({
    required this.value,
    required this.label,
  });

  @override
  List<Object> get props => [
        value,
        label,
      ];
}