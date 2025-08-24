import 'package:gemini_ai_demo/features/chat/data/services/gemini_service.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final List<ChatMessage> _messages = [];
  final GeminiService _geminiService = GeminiService();

  @override
  Future<List<ChatMessage>> getChatHistory() async {
    return List.unmodifiable(_messages);
  }

  @override
  Future<void> saveMessage(ChatMessage message) async {
    _messages.add(message);
  }

  @override
  Future<void> clearChatHistory() async {
    _messages.clear();
  }

  @override
  Future<String> sendMessage(String message) async {
    // Call Gemini instead of mock response
    return _geminiService.sendMessage(message);
  }
}
