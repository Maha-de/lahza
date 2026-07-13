import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';

@JsonSerializable()

class ChatMessagesModel {
  String id;
  String senderId;
  String type;
  String? message;
  String? fileUrl;
  String? fileName;
  String? fileType;
  String status;
  DateTime createdAt;

  ChatMessagesModel({
    required this.id,
    required this.senderId,
    required this.type,
    required this.message,
    required this.fileUrl,
    required this.fileName,
    required this.fileType,
    required this.status,
    required this.createdAt,
  });


  factory ChatMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessagesModelToJson(this);

}