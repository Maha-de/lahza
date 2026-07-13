import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'dart:convert';
import 'package:lahza/features/chat/api_client/chat_client.dart';
import 'package:lahza/features/chat/models/chat_model.dart';



@LazySingleton()
class ChatRepository {
  final ChatClient client;

  ChatRepository({required this.client});

  Future<ChatMessagesModel> getMessages() async {
    try {
      final response = await client.getMessages();

      await CacheHelper.saveData(key: 'cached_Messages', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_Messages');
      if (cachedData != null) {
        return ChatMessagesModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

  Future<ChatMessagesModel> sendMessage() async {
    try {
      final response = await client.getMessages();

      await CacheHelper.saveData(key: 'send_Messages', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'send_Messages');
      if (cachedData != null) {
        return ChatMessagesModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

  Future<ChatMessagesModel> createChat() async {
    try {
      final response = await client.getMessages();

      await CacheHelper.saveData(key: 'create_chat', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'create_chat');
      if (cachedData != null) {
        return ChatMessagesModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }


}