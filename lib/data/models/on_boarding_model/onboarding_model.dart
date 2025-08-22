
class OnboardingModel {
  final int id;
  final String title, subtitle, image;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    print("Data: $json");
    return OnboardingModel(
      id: json["id"],
      title: json["title"],
      subtitle: json["subtitle"],
      image: json["image"],
    );
  }
}
