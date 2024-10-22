class ChatEntity {
  final String text;
  final bool isMe;

  ChatEntity({
    required this.text,
    this.isMe = false,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      text: json['text'],
      isMe: false,
    );
  }
}
