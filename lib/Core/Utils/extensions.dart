import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/icons.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';
import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/gen/assets.gen.dart';
import 'package:intl/intl.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:url_launcher/url_launcher_string.dart';

extension UserStatusExtension on int? {
  UserStatus toUserStatus() {
    switch (this) {
      case null:
        return UserStatus.loggedOut;
      case 1:
        return UserStatus.loggedIn;
      case 2:
        return UserStatus.loggedOut;
      default:
        return UserStatus.loggedOut;
    }
  }
}

extension UserStatusExtensionFeedback on UserStatus {
  int toLocalCacheInt() {
    switch (this) {
      case UserStatus.loggedIn:
        return 1;
      case UserStatus.loggedOut:
        return 2;
    }
  }
}

extension NumExt on num {
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());
  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());
  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());
  EdgeInsets symmetricPadding(num other) => EdgeInsets.symmetric(
        vertical: toDouble(),
        horizontal: other.toDouble(),
      );
}

extension ProjectCardExt on List<ProjectUser> {
  String get showContributors => map((user) => user.firstName).join(', ');
}

extension ProjectStatusExt on String? {
  ProjectStatus toProjectStatus() {
    switch (this) {
      case 'Not Started':
        return ProjectStatus.notStarted;
      case 'In Progress':
        return ProjectStatus.inProgress;
      case 'Done':
        return ProjectStatus.done;
      default:
        return ProjectStatus.notStarted;
    }
  }
}

extension ProjectStatusStringExt on ProjectStatus {
  String toStr() {
    switch (this) {
      case ProjectStatus.notStarted:
        return 'Not Started';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.done:
        return 'Done';
      default:
        return 'Not Started';
    }
  }
}

/// Extension on DateTime to provide additional formatting methods.
extension DateTimeFormatting on DateTime {
  /// Returns the abbreviated day of the week (Mon, Tue, Wed, etc.).
  String toReadableDate() {
    return DateFormat('EEE').format(this);
  }

  /// Returns the full date in "day/month/year" format.
  String toFullDate() {
    return DateFormat('dd.MM.yyyy').format(this);
  }
}

/// Extension on int to convert a month number into a month name.
extension IntToMonthName on int {
  /// Returns the full name of the month (January, February, etc.).
  String convertToMonthName() => DateFormat('MMMM').format(DateTime(0, this));
}

extension CoursesListStringExt on CoursesList {
  String toStr() {
    switch (this) {
      case CoursesList.selectCourses:
        return 'Select Courses';
      case CoursesList.medizin:
        return 'Medizin';
      case CoursesList.informatik:
        return 'Informatik';
      case CoursesList.bwlVml:
        return 'BWL/VML';
      case CoursesList.wirtschaftsinormatik:
        return 'Wirtschaftsinformatik';
      default:
        return 'Select Courses';
    }
  }
}

extension MediaTypes on String {
  http_parser.MediaType toMediaType() => http_parser.MediaType.parse(this);
}

extension UserProfile on ProjectFile {
  String get fileUrl => '${AppConfig().baseFileUrl}/uploads/$filename';
}

extension UserExtensions on User {
  Image getImage() {
    if (profilePicture != null) {
      return Image.network(
        profilePicture!.fileUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Assets.png.placeholderProfile.image(),
      );
    } else {
      return Assets.png.placeholderProfile.image(
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Assets.png.placeholderProfile.image(),
      );
    }
  }
}

String toCamelCase(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

extension TimeAgo on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else {
      return '${difference.inDays ~/ 7} week${difference.inDays ~/ 7 > 1 ? 's' : ''} ago';
    }
  }
}

extension TagTypeExtensions on String {
  TagType get toTagType {
    switch (this) {
      case 'course':
        return TagType.course;
      case 'tag':
        return TagType.tag;
      case 'studyProgram':
        return TagType.studyProgram;
      default:
        return TagType.tag;
    }
  }
}

extension TagTypeExtensionsStr on TagType {
  String get toTagName {
    switch (this) {
      case TagType.course:
        return 'course';
      case TagType.tag:
        return 'tag';
      case TagType.studyProgram:
        return 'studyProgram';
      default:
        return 'tag';
    }
  }
}

extension StringURLExtensions on String {
  Future<void> launchURL() async {
    if (!await launchUrlString(this)) {
      throw Exception('Could not launch $this');
    }
  }
}

extension NotificationTypeExtension on NotificationType {
  String get value {
    switch (this) {
      case NotificationType.like:
        return 'like';
      case NotificationType.comment:
        return 'comment';
      case NotificationType.addTeamMember:
        return 'addTeamMember';
      case NotificationType.joinTeamMember:
        return 'joinTeamMember';
      case NotificationType.projectUpdate:
        return 'projectUpdate';
      case NotificationType.bookmark:
        return 'bookmark';
      default:
        return '';
    }
  }

  IconData get toIcon {
    switch (this) {
      case NotificationType.like:
        return Iconsax.like_1;
      case NotificationType.comment:
        return Iconsax.messages_3;
      case NotificationType.addTeamMember:
        return Iconsax.user_add;
      case NotificationType.joinTeamMember:
        return Iconsax.user_add;
      case NotificationType.projectUpdate:
        return Iconsax.info_circle;
      case NotificationType.bookmark:
        return Icons.bookmark;
      default:
        return Iconsax.info_circle;
    }
  }
}

extension ParseToString on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'like':
        return NotificationType.like;
      case 'comment':
        return NotificationType.comment;
      case 'addTeamMember':
        return NotificationType.addTeamMember;
      case 'joinTeamMember':
        return NotificationType.joinTeamMember;
      case 'projectUpdate':
        return NotificationType.projectUpdate;
      case 'bookmark':
        return NotificationType.bookmark;
      default:
        return NotificationType.like;
    }
  }
}

extension ParserCheck on List {
  bool get isListMapStringDynamic {
    if (runtimeType == List<dynamic>) {
      final List<dynamic> tempList = this;
      if (tempList.isEmpty) return false;
      return tempList.first is Map<String, dynamic>;
    } else {
      return false;
    }
  }
}

extension FormatUrl on String {
  String? formatUrl() {
    const urlPattern =
        r'^(https?:\/\/)?(www\.)?([a-zA-Z0-9._-]+\.[a-zA-Z]{2,6})(\/\S*)?$';
    final urlRegExp = RegExp(urlPattern);

    return urlRegExp.hasMatch(this) ? this : null;
  }
}
