import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class Notification {
  final String id;
  final String title;
  final String message;
  final bool isRead;
  final NotificationType type;
  final Project projectId;
  final User sender;
  final String receiver;
  final bool processed;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.isRead,
    required this.type,
    required this.projectId,
    required this.sender,
    required this.receiver,
    this.processed = false,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['_id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
      type: (json['type'] as String).toNotificationType(),
      projectId: Project.fromJson(json['projectId']),
      sender: User.fromJson(json['sender']),
      receiver: json['receiver'] as String,
      processed: json['processed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'message': message,
      'isRead': isRead,
      'type': type.value,
      'projectId': projectId,
      'sender': sender,
      'receiver': receiver,
      'processed': processed,
    };
  }
}
