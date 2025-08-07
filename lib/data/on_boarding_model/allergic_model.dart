class AllergicModel {
  final int id;
  final String title, image;

  AllergicModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory AllergicModel.fromJson(Map<String, dynamic> json) {
    return AllergicModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
