import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/chat/cubit/chat_state.dart';
import 'package:lahza/features/chat/models/chat_model.dart';
import 'package:lahza/features/chat/repositories/chat_repository.dart';





@Injectable()
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit({required this.repository}) : super(ChatInitial());

  void fetchMessages() async {
    emit(ChatLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getMessages());

    switch (response) {
      case SuccessBaseResponse<ChatMessagesModel>():
        final data = response.data;
        emit(ChatSuccess(chatModel: data));

      case ErrorBaseResponse<ChatMessagesModel>():
        emit(ChatError(errorModel: response.errorModel));
    }
  }


  void sendMessage() async {
    emit(ChatLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.sendMessage());

    switch (response) {
      case SuccessBaseResponse<ChatMessagesModel>():
        final data = response.data;
        emit(ChatSuccess(chatModel: data));

      case ErrorBaseResponse<ChatMessagesModel>():
        emit(ChatError(errorModel: response.errorModel));
    }
  }

  void createChat() async {
    emit(ChatLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.createChat());

    switch (response) {
      case SuccessBaseResponse<ChatMessagesModel>():
        final data = response.data;
        emit(ChatSuccess(chatModel: data));

      case ErrorBaseResponse<ChatMessagesModel>():
        emit(ChatError(errorModel: response.errorModel));
    }
  }

}



