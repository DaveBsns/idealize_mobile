import 'package:idealize_new_version/Core/Data/Models/project_comment_model.dart';
import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class CommentService extends ServicesHelper {
  Future<bool> comment(
    String projectId,
    String userId, {
    required String content,
    required String projectOwnerId,
    String? parentCommentId,
  }) async {
    final response = await request(
      '$baseURL/comments/new',
      serviceType: ServiceType.post,
      requiredDefaultHeader: true,
      body: {
        'projectId': projectId,
        'userId': userId,
        'parentCommentId': parentCommentId,
        'content': content,
        'projectOwnerId': projectOwnerId
      },
    );

    return response.toString().toLowerCase() == 'true';
  }

  Future<bool> deleteComment(String commentId) async {
    final response = await request(
      '$baseURL/comments/$commentId',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return response.toString().toLowerCase() == 'true';
  }

  Future<List<ProjectComment>> fetchAllCommnets(String projectId,
      {int page = 1}) async {
    final result = await request(
      '$baseURL/comments/$projectId/?limit=5&page=$page',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return [
      for (final item in result['comments']) ProjectComment.fromJson(item),
    ];
  }
}
