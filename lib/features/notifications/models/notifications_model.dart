import 'package:json_annotation/json_annotation.dart';
part 'notifications_model.g.dart';

@JsonSerializable()
class NotificationsModel {
  bool success;
  int count;
  List<Data> data;

  NotificationsModel({
    required this.success,
    required this.count,
    required this.data,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    success: json["success"],
    count: json["count"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  String id;
  String userId;
  String title;
  String body;
  String type;
  String? referenceId;
  bool isRead;
  DateTime createdAt;

  Data({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    required this.referenceId,
    required this.isRead,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["userId"],
    title: json["title"],
    body: json["body"],
    type: json["type"],
    referenceId: json["referenceId"],
    isRead: json["isRead"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
    "body": body,
    "type": type,
    "referenceId": referenceId,
    "isRead": isRead,
    "createdAt": createdAt.toIso8601String(),
  };
}
