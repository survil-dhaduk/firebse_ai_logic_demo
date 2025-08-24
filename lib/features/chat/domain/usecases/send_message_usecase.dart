import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessage> call(String message) async {
    // Create user message
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: message,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );

    // Save user message
    await repository.saveMessage(userMessage);

    // Send to AI and get response
    final aiResponse =  await repository.sendMessage(message);

    // Create AI message
    final aiMessage = ChatMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      content: aiResponse,
      type: MessageType.ai,
      timestamp: DateTime.now(),
    );

    // Save AI message
    await repository.saveMessage(aiMessage);

    return aiMessage;
  }
}
