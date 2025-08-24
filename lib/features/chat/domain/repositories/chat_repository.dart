import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<List<ChatMessage>> getChatHistory();
  Future<void> saveMessage(ChatMessage message);
  Future<void> clearChatHistory();
  Future<String> sendMessage(String message);
}
