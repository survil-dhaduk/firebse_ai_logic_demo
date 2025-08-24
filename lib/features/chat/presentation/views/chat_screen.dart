import 'package:flutter/material.dart';
import 'package:gemini_ai_demo/features/chat/data/repositories/chat_repository_impl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late ChatController _chatController;
    ChatRepository chatRepository=ChatRepositoryImpl();

  @override
  void initState() {
    super.initState();

    _chatController = ChatController(SendMessageUseCase(chatRepository));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      _chatController.sendMessage(message);
      _messageController.clear();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.chatTitle),
        backgroundColor: AppColors.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear Chat'),
                  content: const Text(
                    'Are you sure you want to clear all messages?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        _chatController.clearChat();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Clear'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListenableBuilder(
              listenable: _chatController,
              builder: (context, child) {
                final messages = _chatController.messages;

                if (messages.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: AppColors.onSurfaceVariant.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        const SizedBox(height: AppStyles.spacing16),
                        Text(
                          AppStrings.noMessages,
                          style: AppStyles.bodyLarge.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(AppStyles.spacing16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return _MessageBubble(message: message);
                  },
                );
              },
            ),
          ),

          // Error Message
          ListenableBuilder(
            listenable: _chatController,
            builder: (context, child) {
              if (_chatController.error.isNotEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppStyles.spacing16),
                  color: AppColors.errorContainer,
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 20,
                      ),
                      const SizedBox(width: AppStyles.spacing8),
                      Expanded(
                        child: Text(
                          _chatController.error,
                          style: AppStyles.bodyMedium.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _chatController.clearError,
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          // Input Area
          Container(
            padding: const EdgeInsets.all(AppStyles.spacing16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: AppStyles.shadowSmall,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: AppStrings.chatHint,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyles.radius24),
                        borderSide: const BorderSide(
                          color: AppColors.inputBorder,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyles.radius24),
                        borderSide: const BorderSide(
                          color: AppColors.inputBorder,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppStyles.radius24),
                        borderSide: const BorderSide(
                          color: AppColors.inputFocusedBorder,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppStyles.spacing16,
                        vertical: AppStyles.spacing12,
                      ),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: AppStyles.spacing12),
                ListenableBuilder(
                  listenable: _chatController,
                  builder: (context, child) {
                    return ElevatedButton(
                      onPressed: _chatController.isLoading
                          ? null
                          : _sendMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.onPrimary,
                        elevation: 0,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(AppStyles.spacing12),
                      ),
                      child: _chatController.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.onPrimary,
                                ),
                              ),
                            )
                          : const Icon(Icons.send),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;
    final isTyping = message.isTyping;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppStyles.spacing12),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            // AI Avatar
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppStyles.radius16),
              ),
              child: const Icon(
                Icons.psychology,
                size: 18,
                color: AppColors.onPrimary,
              ),
            ),
            const SizedBox(width: AppStyles.spacing8),
          ],

          // Message Bubble
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyles.spacing16,
                vertical: AppStyles.spacing12,
              ),
              decoration: BoxDecoration(
                color: isUser
                    ? AppColors.userMessageBackground
                    : AppColors.aiMessageBackground,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(AppStyles.radius16),
                  topRight: const Radius.circular(AppStyles.radius16),
                  bottomLeft: Radius.circular(
                    isUser ? AppStyles.radius16 : AppStyles.radius4,
                  ),
                  bottomRight: Radius.circular(
                    isUser ? AppStyles.radius4 : AppStyles.radius16,
                  ),
                ),
                boxShadow: AppStyles.shadowSmall,
              ),
              child: isTyping
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.aiMessageText,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppStyles.spacing8),
                        Text(
                          AppStrings.typingIndicator,
                          style: AppStyles.bodyMedium.copyWith(
                            color: AppColors.aiMessageText,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      message.content,
                      style: isUser
                          ? AppStyles.userMessageText
                          : AppStyles.aiMessageText,
                    ),
            ),
          ),

          if (isUser) ...[
            const SizedBox(width: AppStyles.spacing8),
            // User Avatar
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppStyles.radius16),
              ),
              child: const Icon(
                Icons.person,
                size: 18,
                color: AppColors.onPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
