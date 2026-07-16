// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    NotificationsModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      referenceId: json['referenceId'] as String?,
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      isBroadcast: json['isBroadcast'] as bool,
      sender: json['sender'] == null
          ? null
          : Receiver.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsModelToJson(NotificationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'referenceId': instance.referenceId,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'isBroadcast': instance.isBroadcast,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
};
