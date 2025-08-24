import 'package:flutter/material.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/send_message_usecase.dart';

class ChatController extends ChangeNotifier {
  final SendMessageUseCase _sendMessageUseCase;
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  String _error = '';

  ChatController(this._sendMessageUseCase) {
    _initializeChat();
  }

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isLoading => _isLoading;
  String get error => _error;

  void _initializeChat() {
    // Add welcome message
    final welcomeMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content:
          'Hello! I\'m Gemini, your AI assistant. How can I help you today?',
      type: MessageType.ai,
      timestamp: DateTime.now(),
    );
    _messages.add(welcomeMessage);
    notifyListeners();
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    _error = '';
    _isLoading = true;
    notifyListeners();

    try {
      // Add user message immediately
      final userMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: content.trim(),
        type: MessageType.user,
        timestamp: DateTime.now(),
      );
      _messages.add(userMessage);
      notifyListeners();

      // Add typing indicator
      final typingMessage = ChatMessage(
        id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
        content: '',
        type: MessageType.ai,
        timestamp: DateTime.now(),
        isTyping: true,
      );
      _messages.add(typingMessage);
      notifyListeners();

      // Send message and get response
      final aiMessage = await _sendMessageUseCase(content.trim());

      // Remove typing indicator and add AI response
      _messages.removeLast();
      _messages.add(aiMessage);
    } catch (e) {
      _error = 'Failed to send message. Please try again.';
      // Remove typing indicator if there was an error
      if (_messages.isNotEmpty && _messages.last.isTyping) {
        _messages.removeLast();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearChat() {
    _messages.clear();
    _error = '';
    _initializeChat();
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }
}
