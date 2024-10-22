import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

class HomeModel {
  final List<Project> _projects = [];

  List<Project> get projects => _projects;
  void updateProjects(List<Project> projects) {
    if (projects.isNotEmpty) {
      _projects.clear();
      _projects.addAll(projects);
    }
  }
}
