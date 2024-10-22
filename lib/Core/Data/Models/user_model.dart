import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class User {
  final String id;
  final String email;
  final String firstname;
  final String surname;
  final bool? status;
  final String? token;
  final String? refreshToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ProjectFile? profilePicture;
  final List<Tag> interestedTags;
  final List<Tag> interestedCourses;
  final List<Tag> studyPrograms;
  final String? username;

  User({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.firstname,
    required this.surname,
    this.status,
    this.username,
    this.token,
    this.refreshToken,
    required this.updatedAt,
    this.profilePicture,
    this.interestedCourses = const [],
    this.interestedTags = const [],
    this.studyPrograms = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      status: json['status'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      firstname: json['firstName'],
      surname: json['lastName'],
      token: json['token'],
      refreshToken: json['refreshToken'],
      username: json['username'],
      profilePicture: (json['profilePicture'] != null &&
              json['profilePicture'] is Map<String, dynamic>)
          ? ProjectFile.fromJson(json['profilePicture'])
          : null,
      interestedTags: (json['interestedTags'] != null &&
              (json['interestedTags'] as List).isListMapStringDynamic)
          ? [...json['interestedTags'].map((e) => Tag.fromJson(e)).toList()]
          : [],
      interestedCourses: (json['interestedCourses'] != null &&
              (json['interestedCourses'] as List).isListMapStringDynamic)
          ? [...json['interestedCourses'].map((e) => Tag.fromJson(e)).toList()]
          : [],
      studyPrograms: (json['studyPrograms'] != null &&
              (json['studyPrograms'] as List).isListMapStringDynamic)
          ? [...json['studyPrograms'].map((e) => Tag.fromJson(e)).toList()]
          : [],
    );
  }

  factory User.fromLocalCacheJson(
    Map<String, dynamic> json, {
    String? token,
    String? refreshToken,
  }) {
    return User(
      id: json['_id'],
      email: json['email'],
      status: json['status'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      firstname: json['firstName'],
      surname: json['lastName'],
      token: token ?? json['token'],
      refreshToken: refreshToken ?? json['refreshToken'],
      username: json['username'],
      profilePicture: (json['profilePicture'] != null &&
              json['profilePicture'] is Map<String, dynamic>)
          ? ProjectFile.fromJson(json['profilePicture'])
          : null,
      interestedTags: (json['interestedTags'] != null &&
              json['interestedTags'] is List<dynamic>)
          ? [...json['interestedTags'].map((e) => Tag.fromJson(e)).toList()]
          : [],
      interestedCourses: (json['interestedCourses'] != null &&
              json['interestedCourses'] is List<dynamic>)
          ? [...json['interestedCourses'].map((e) => Tag.fromJson(e)).toList()]
          : [],
      studyPrograms: (json['studyPrograms'] != null &&
              json['studyPrograms'] is List<dynamic>)
          ? [...json['studyPrograms'].map((e) => Tag.fromJson(e)).toList()]
          : [],
    );
  }
}
