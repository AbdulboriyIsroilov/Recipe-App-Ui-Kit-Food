class CategoriesModel {
  final String title, description, difficulty, photo;
  final int id, categoryId, timeRequired;
  final num rating;

  CategoriesModel({
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.rating,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json["title"],
      description: json["description"],
      difficulty: json["difficulty"],
      photo: json["photo"],
      id: json["id"],
      categoryId: json["categoryId"],
      timeRequired: json["timeRequired"],
      rating: json["rating"],
    );
  }
}
