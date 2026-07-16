import 'package:json_annotation/json_annotation.dart';
part 'notifications_model.g.dart';

@JsonSerializable()
class NotificationsModel {

  String? id;
  String? userId;
  String? title;
  String? body;
  String? type;
  String? referenceId;
  bool isRead;
  DateTime? createdAt;
  String? senderId;
  String? receiverId;
  bool isBroadcast;
  Receiver? sender;
  Receiver? receiver;

  NotificationsModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
     this.type,
    required this.referenceId,
    required this.isRead,
    required this.createdAt,
     this.senderId,
    required this.receiverId,
    required this.isBroadcast,
     this.sender,
    required this.receiver,
  });


  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);

}

@JsonSerializable()
class Receiver {
  String? id;
  String? fullName;
  String? phone;

  Receiver({
    required this.id,
    required this.fullName,
    required this.phone,
  });


  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);

}

