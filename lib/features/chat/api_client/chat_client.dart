import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/chat/models/chat_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'chat_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ChatClient {
  @factoryMethod
  factory ChatClient(Dio dio) = _ChatClient;

  @GET(AppEndPoints.getMessages)
  Future<ChatMessagesModel> getMessages();

  @POST(AppEndPoints.createChat)
  Future<ChatMessagesModel> createChat(@Path("id") String id);

  @POST(AppEndPoints.sendMessage)
  Future<ChatMessagesModel> sendMessage();
  //
  // @GET("messages/{conversation_id}")
  // Future<List<MessageModel>> getMessages(@Path("conversation_id") String conversationId);
  //
  // @POST("messages/send")
  // Future<MessageModel> sendMessage(@Body() MessageRequest request);

}
