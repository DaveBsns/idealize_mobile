abstract class ReportBugRepo {
  Future<Map<String, dynamic>?> reportBug({
    required String bugDesc,
  });
}
