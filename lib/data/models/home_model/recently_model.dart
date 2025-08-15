class RecentlyModel {
  final int id, categoryId;
  final String title, description, photo;
  final num timeRequired, rating;

  RecentlyModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory RecentlyModel.fromJson(Map<String, dynamic> json) {
    return RecentlyModel(
      id: json["id"],
      categoryId: json["categoryId"],
      title: json["title"] ?? "",
      description: json["description"],
      photo: json["photo"],
      timeRequired: json["timeRequired"],
      rating: json["rating"],
    );
  }
}
