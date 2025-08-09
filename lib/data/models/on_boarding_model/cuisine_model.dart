class CuisineModel {
  final int id;
  final String title, image;

  CuisineModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) {
    return CuisineModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
