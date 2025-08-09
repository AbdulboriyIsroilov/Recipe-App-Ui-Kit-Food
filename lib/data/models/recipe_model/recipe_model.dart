class RecipeModel {
  final String title, image;
  final int id;

  RecipeModel({
    required this.title,
    required this.image,
    required this.id,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json["title"],
      image: json["image"],
      id: json["id"],
    );
  }
}
