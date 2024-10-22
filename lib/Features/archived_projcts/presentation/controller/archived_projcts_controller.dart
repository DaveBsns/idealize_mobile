import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

import '../../domain/archived_projcts_repo.dart';

class ArchivedProjctsController extends GetxController {
  late ArchivedProjctsRepository repo;

  RxList<Project> archives = RxList([]);

  ArchivedProjctsController({
    required this.repo,
  });

  void fetchAllArchives() async {
    archives.clear();
    archives.addAll(await repo.fetchAll());
  }

  @override
  void onInit() {
    fetchAllArchives();
    super.onInit();
  }
}
