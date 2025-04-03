import 'package:idealize_new_version/Core/Data/Models/user_model.dart';

class ProjectLikes {
  final String id;
  final User user;

  ProjectLikes({required this.id, required this.user});

  factory ProjectLikes.fromJson(Map<String, dynamic> json) {
    return ProjectLikes(id: json['_id'], user: User.fromJson(json['userId']));
  }
}

class ProjectComment {
  final String id;
  final User user;
  final ProjectComment? parentCommentId;
  final String content;
  final DateTime createdAt;
  final (int, List<ProjectComment>) replies;

  ProjectComment({
    required this.id,
    required this.user,
    required this.content,
    this.parentCommentId,
    required this.createdAt,
    this.replies = (0, const []),
  });

  factory ProjectComment.fromJson(Map<String, dynamic> json) {
    return ProjectComment(
        id: json['_id'],
        user: User.fromJson(json['user']),
        content: json['content'],
        parentCommentId: (json['parentCommentId'] != null &&
                json['parentCommentId'] is Map<String, dynamic>)
            ? ProjectComment.fromJson(json['parentCommentId'])
            : null,
        createdAt: DateTime.parse(json['createdAt']),
        replies: (json['replies'] != null &&
                json['replies'] is List &&
                json['replies'].isNotEmpty)
            ? (
                json['replies'].length,
                [
                  for (final commentJson in json['replies'])
                    ProjectComment.fromJson(commentJson)
                ]
              )
            : (0, []));
  }
}
