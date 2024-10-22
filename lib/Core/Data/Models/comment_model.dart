import 'package:idealize_new_version/Core/Data/Models/user_permission_user_model.dart';

class Comment {
  int? id;
  String commentText;
  int numOfLikes;
  DateTime commentDate;
  List<CommentLike> commentLikes;
  List<CommentReply> commentReplies;
  UsersPermissionsUser usersPermissionsUser;

  Comment({
    this.id,
    required this.commentText,
    required this.numOfLikes,
    required this.commentDate,
    required this.commentLikes,
    required this.commentReplies,
    required this.usersPermissionsUser,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      commentText: json['attributes']['commentText'],
      numOfLikes: json['attributes']['numOfLikes'],
      commentDate: DateTime.parse(json['attributes']['commentDate']),
      commentLikes: json['attributes']['comment_likes']['data'] != null &&
              json['attributes']['comment_likes']['data'] != []
          ? List<CommentLike>.from(json['attributes']['comment_likes']['data']
              .map((x) => CommentLike.fromJson(x['attributes'])))
          : [], // If 'comment_likes' is null or an empty list, assign an empty list to 'commentLikes'
      commentReplies: json['attributes']['comment_replies']['data'] != null &&
              json['attributes']['comment_replies']['data'] != []
          ? List<CommentReply>.from(json['attributes']['comment_replies']
                  ['data']
              .map((x) => CommentReply.fromJson(x['attributes'])))
          : [], // If 'comment_replies' is null or an empty list, assign an empty list to 'commentReplies'
      usersPermissionsUser:
          json['attributes']['users_permissions_user']['data'] != null &&
                  json['attributes']['users_permissions_user']['data'] != []
              ? UsersPermissionsUser.fromJson(
                  json['attributes']['users_permissions_user']['data'])
              : UsersPermissionsUser(
                  id: 0,
                  // Set the alternative values here
                  username: '',
                  email: '',
                  provider: '',
                  confirmed: false,
                  blocked: false,
                  firstname: '',
                  surname: '',
                ),
    );
  }
}

class CommentReply {
  String commentText;
  int numOfLikes;
  DateTime commentDate;
  List<CommentLike> commentLikes;
  UsersPermissionsUser usersPermissionsUser;

  CommentReply(
      {required this.commentText,
      required this.numOfLikes,
      required this.commentDate,
      required this.commentLikes,
      required this.usersPermissionsUser});

  factory CommentReply.fromJson(Map<String, dynamic> json) {
    return CommentReply(
        commentText: json['replyText'],
        numOfLikes: int.tryParse(json['numOfLikes'] ?? '0') ?? 0,
        commentDate: DateTime.parse(json['replyDate']),
        commentLikes: [],
        usersPermissionsUser: json['users_permissions_user']['data'] != null &&
                json['users_permissions_user']['data'] != []
            ? UsersPermissionsUser.fromJson(
                json['users_permissions_user']['data'])
            : UsersPermissionsUser(
                id: 0,
                // Set the alternative values here
                username: '',
                email: '',
                provider: '',
                confirmed: false,
                blocked: false,
                firstname: '',
                surname: '',
              ));
  }
}

class CommentLike {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  CommentLike({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory CommentLike.fromJson(Map<String, dynamic> json) {
    return CommentLike(
      id: json['id'],
      createdAt: DateTime.parse(json['attributes']['createdAt']),
      updatedAt: DateTime.parse(json['attributes']['updatedAt']),
      publishedAt: DateTime.parse(json['attributes']['publishedAt']),
    );
  }
}
