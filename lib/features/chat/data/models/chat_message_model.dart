import '../../domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.id,
    required super.content,
    required super.type,
    required super.timestamp,
    super.isTyping = false,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] as String,
      content: json['content'] as String,
      type: MessageType.values.firstWhere(
        (e) => e.toString() == 'MessageType.${json['type']}',
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isTyping: json['isTyping'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'type': type.toString().split('.').last,
      'timestamp': timestamp.toIso8601String(),
      'isTyping': isTyping,
    };
  }

  factory ChatMessageModel.fromEntity(ChatMessage entity) {
    return ChatMessageModel(
      id: entity.id,
      content: entity.content,
      type: entity.type,
      timestamp: entity.timestamp,
      isTyping: entity.isTyping,
    );
  }

  ChatMessage toEntity() {
    return ChatMessage(
      id: id,
      content: content,
      type: type,
      timestamp: timestamp,
      isTyping: isTyping,
    );
  }
}
