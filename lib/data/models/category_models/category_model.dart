class CategoriyModel {
  final String title, image;
  final int id;

  CategoriyModel({
    required this.title,
    required this.image,
    required this.id,
  });

  factory CategoriyModel.fromJson(Map<String, dynamic> json) {
    return CategoriyModel(
      title: json["title"],
      image: json["image"],
      id: json["id"],
    );
  }
}
