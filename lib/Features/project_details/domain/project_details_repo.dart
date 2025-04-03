import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

import '../../../Core/Data/Models/project_comment_model.dart';

abstract class ProjectDetailsRepository {
  Future<Project> projectDetails(String projectId);
  Future<bool> like(String projectId, String ownerId, String userId);
  Future<bool> unlike(String likeId);
  Future<List<ProjectComment>> comments(
    String projectId, {
    int page = 1,
  });
  Future<List<ProjectLikes>> likes(
    String projectId, {
    int page = 1,
  });
  Future<bool> leaveComment(
    String projectId,
    String userId, {
    required String content,
    required String projectOwnerId,
    String? parentCommentId,
  });
  Future<String?> archive(
      String projectId, String userId, String projectOwnerId);
  Future<bool> unarchive(String archiveId);
  Future<dynamic> join(
    String projectId,
    String userId, {
    String? message,
  });
  Future<dynamic> report(
    String projectId,
    String reportedUserId, {
    String type = 'project', // 'project' | 'comment' | 'user'
    String content = '',
  });

  Future<void> deleteComment(String commentId);
}
