class CategoriyModel {
  final String title;
  final int id;

  CategoriyModel({
    required this.title,
    required this.id,
  });

  factory CategoriyModel.fromJson(Map<String, dynamic> json) {
    return CategoriyModel(
      title: json["title"] ?? "",
      id: json["id"],
    );
  }
}
