enum MessageType { user, ai }

class ChatMessage {
  final String id;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isTyping;

  const ChatMessage({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
    this.isTyping = false,
  });

  ChatMessage copyWith({
    String? id,
    String? content,
    MessageType? type,
    DateTime? timestamp,
    bool? isTyping,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isTyping: isTyping ?? this.isTyping,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChatMessage &&
        other.id == id &&
        other.content == content &&
        other.type == type &&
        other.timestamp == timestamp &&
        other.isTyping == isTyping;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        type.hashCode ^
        timestamp.hashCode ^
        isTyping.hashCode;
  }

  @override
  String toString() {
    return 'ChatMessage(id: $id, content: $content, type: $type, timestamp: $timestamp, isTyping: $isTyping)';
  }
}
