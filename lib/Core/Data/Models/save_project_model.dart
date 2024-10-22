class SavedProject {
  final int savedProjectId;
  final int projectId;
  SavedProject({required this.savedProjectId, required this.projectId});

  factory SavedProject.fromJson(Map<String, dynamic> jsonData) {
    return SavedProject(
        projectId: jsonData['attributes']['project']['data']['id'],
        savedProjectId: jsonData['id']);
  }
}
