enum ServiceType { get, post, put, patch, delete }

enum UserStatus { loggedIn, loggedOut }

enum ProjectStatus { notStarted, inProgress, done }

enum CoursesList {
  selectCourses,
  medizin,
  informatik,
  bwlVml,
  wirtschaftsinormatik
}

enum TagType { tag, course, studyProgram }

enum NotificationType {
  like,
  comment,
  addTeamMember,
  joinTeamMember,
  projectUpdate,
  bookmark,
  joinProject
}

enum RequestResponseType {
  accepted,
  canceled,
  pending,
}

enum CustomCheckBoxValue { checked, unchecked, error }

enum ServiceHelperCustomResponse { activateAccount }
