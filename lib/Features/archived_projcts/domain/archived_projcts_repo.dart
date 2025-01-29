import 'dart:async';

import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

abstract class ArchivedProjctsRepository {
  Future<List<Project>> fetchAll();
  Future<String?> archive({required String projectId});
  Future<bool> unarchive({required String archiveId});
}
