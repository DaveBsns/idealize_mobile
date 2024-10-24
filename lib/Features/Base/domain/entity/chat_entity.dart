class ChatEntity {
  final String text;
  final bool isMe;
  final List<dynamic> projects;
  final List<dynamic> users;

  ChatEntity({
    required this.text,
    this.isMe = false,
    this.projects = const [],
    this.users = const [],
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      text: json['text'],
      isMe: false,
      projects: json['projects'] ?? [],
      users: json['users'] ?? [],
    );
  }
}
