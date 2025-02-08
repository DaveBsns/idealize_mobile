import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Data/Services/tags_service.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

import '../../../../Core/Data/Models/tag_model.dart';
import '../../../../app_repo.dart';

class TagSelectorController extends GetxController {
  final searchCtrl = TextEditingController();

  List<Tag> initialChipData = [];
  List<Tag> initialSelectedChipData = [];

  RxList<Tag> selectedTags = RxList<Tag>([]);
  RxList<Tag> tags = RxList<Tag>([]);
  TagType type = TagType.tag;

  init({
    required List<Tag> initialChipDataList,
    required List<Tag> initialSelectedChipDataList,
    required TagType typeValue,
  }) {
    type = typeValue;

    tags.clear();
    tags.addAll(initialChipDataList);

    selectedTags.clear();
    selectedTags.addAll(initialSelectedChipDataList);

    initialChipData.clear();
    initialSelectedChipData.clear();

    initialChipData.addAll(initialChipDataList);
    initialSelectedChipData.addAll(initialSelectedChipDataList);

    reorderTagsBasedOnSelectedTags();
  }

  Future<void> addNewTag(String tagName) async {
    await TagService().addNewTag(
      tagName,
      type: type.toTagName,
    );
    AppRepo().tags.clear();
    AppRepo().tags.addAll(await TagService().fetchAllTags());

    init(
      initialChipDataList: AppRepo()
          .tags
          .where(
            (tagItem) => tagItem.type == type,
          )
          .toList(),
      initialSelectedChipDataList: initialSelectedChipData,
      typeValue: type,
    );

    Get.back();
    searchCtrl.text = '';
    search(searchCtrl.text);

    // Bring just inserted tag, up!
    final foundInsertedTag =
        AppRepo().tags.where((tag) => tag.tagName == tagName).toList();
    if (foundInsertedTag.isNotEmpty) {
      reorderTagsBasedOnSelectedTags(selectNewOne: foundInsertedTag.first);
    }
  }

  void search(String searchValue) {
    if (searchValue.isEmpty) {
      tags.clear();
      tags.addAll(initialChipData);
      tags.sort(
        (a, b) => a.tagName.compareTo(b.tagName),
      );

      reorderTagsBasedOnSelectedTags();
      return;
    }

    final searchList = tags
        .where((element) =>
            element.tagName.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    tags.clear();
    tags.addAll(searchList);

    tags.sort(
      (a, b) => a.tagName.compareTo(b.tagName),
    );
  }

  void reorderTagsBasedOnSelectedTags({Tag? selectNewOne}) {
    List<Tag> myList = [];
    for (var selectedTag in selectedTags) {
      tags.removeWhere((tag) => tag.id == selectedTag.id);
    }
    myList.addAll(tags);

    tags.clear();
    if (selectNewOne != null) {
      tags.add(selectNewOne);
    }
    tags.addAll(selectedTags);
    tags.addAll(myList);
  }
}
