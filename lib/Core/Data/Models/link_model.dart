class LinkModel {
  final String label;
  final String link;

  LinkModel({
    required this.label,
    required this.link,
  });

  factory LinkModel.fromJson(var json) {
    if (json.runtimeType is String) {
      return LinkModel(
        label: 'no label',
        link: json,
      );
    } else if (json.runtimeType.toString() == '_Map<String, dynamic>') {
      return LinkModel(
        label: json['label'],
        link: json['link'],
      );
    } else {
      return LinkModel(
        label: 'no label',
        link: 'no link',
      );
    }
  }
}
