import 'package:idealize_new_version/Core/Data/Models/user_model.dart';

class ProjectComment {
  final String id;
  final User userId;
  final ProjectComment? parentCommentId;
  final String content;
  final DateTime createdAt;
  final (int, List<ProjectComment>) replies;

  ProjectComment({
    required this.id,
    required this.userId,
    required this.content,
    this.parentCommentId,
    required this.createdAt,
    this.replies = (0, const []),
  });

  factory ProjectComment.fromJson(Map<String, dynamic> json) {
    return ProjectComment(
        id: json['_id'],
        userId: User.fromJson(json['userId']),
        content: json['content'],
        parentCommentId: (json['parentCommentId'] != null &&
                json['parentCommentId'] is Map<String, dynamic>)
            ? ProjectComment.fromJson(json['parentCommentId'])
            : null,
        createdAt: DateTime.parse(json['createdAt']),
        replies: (json['replies'] != null &&
                json['replies']['comments'] != null &&
                json['replies']['total'] > 0)
            ? (
                json['replies']['total'],
                [
                  for (final commentJson in json['replies']['comments'])
                    ProjectComment.fromJson(commentJson)
                ]
              )
            : (0, []));
  }
}
