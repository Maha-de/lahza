// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessagesModel _$ChatMessagesModelFromJson(Map<String, dynamic> json) =>
    ChatMessagesModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      type: json['type'] as String,
      message: json['message'] as String?,
      fileUrl: json['fileUrl'] as String?,
      fileName: json['fileName'] as String?,
      fileType: json['fileType'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChatMessagesModelToJson(ChatMessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'type': instance.type,
      'message': instance.message,
      'fileUrl': instance.fileUrl,
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
