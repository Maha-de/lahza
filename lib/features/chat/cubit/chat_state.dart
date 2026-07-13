import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/chat/models/chat_model.dart';



@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
  final ChatMessagesModel chatModel;
  ChatSuccess({required this.chatModel });
}

class ChatError extends ChatState {
  final ErrorModel errorModel;
  ChatError({required this.errorModel});
}