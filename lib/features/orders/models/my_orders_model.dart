import 'package:json_annotation/json_annotation.dart';
part 'my_orders_model.g.dart';

@JsonSerializable()

class MyOrdersModel {
  bool success;
  List<Data> data;

  MyOrdersModel({
    required this.success,
    required this.data,
  });

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  String id;
  String requestNumber;
  PhoneType phoneType;
  PhoneModel phoneModel;
  IssueType issueType;
  String? diagnosisResult;
  Status status;
  List<String> attachments;
  DateTime createdAt;

  Data({
    required this.id,
    required this.requestNumber,
    required this.phoneType,
    required this.phoneModel,
    required this.issueType,
    required this.diagnosisResult,
    required this.status,
    required this.attachments,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    requestNumber: json["requestNumber"],
    phoneType: phoneTypeValues.map[json["phoneType"]]!,
    phoneModel: phoneModelValues.map[json["phoneModel"]]!,
    issueType: issueTypeValues.map[json["issueType"]]!,
    diagnosisResult: json["diagnosisResult"],
    status: statusValues.map[json["status"]]!,
    attachments: List<String>.from(json["attachments"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "requestNumber": requestNumber,
    "phoneType": phoneTypeValues.reverse[phoneType],
    "phoneModel": phoneModelValues.reverse[phoneModel],
    "issueType": issueTypeValues.reverse[issueType],
    "diagnosisResult": diagnosisResult,
    "status": statusValues.reverse[status],
    "attachments": List<dynamic>.from(attachments.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
  };
}

enum IssueType {
  CHARGING,
  OTHER,
  SCREEN
}

final issueTypeValues = EnumValues({
  "CHARGING": IssueType.CHARGING,
  "OTHER": IssueType.OTHER,
  "SCREEN": IssueType.SCREEN
});

enum PhoneModel {
  A54
}

final phoneModelValues = EnumValues({
  "a54": PhoneModel.A54
});

enum PhoneType {
  SAMSUNG
}

final phoneTypeValues = EnumValues({
  "samsung": PhoneType.SAMSUNG
});

enum Status {
  CANCELLED,
  COMPLETED,
  PENDING
}

final statusValues = EnumValues({
  "CANCELLED": Status.CANCELLED,
  "COMPLETED": Status.COMPLETED,
  "PENDING": Status.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

