
class TopChefDetailModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, firstName, lastName, presentation;

  TopChefDetailModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
  });

  factory TopChefDetailModel.fromJson(Map<String, dynamic> json) {
    return TopChefDetailModel(
      id: json["id"] ?? 0,
      recipesCount: json["recipesCount"] ?? 0,
      followingCount: json["followingCount"] ?? 0,
      followerCount: json["followerCount"] ?? 0,
      profilePhoto: json["profilePhoto"] ?? "",
      username: json["username"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      presentation: json["presentation"] ?? "",
    );
  }

  factory TopChefDetailModel.empty() {
    return TopChefDetailModel(
      id: 0,
      recipesCount: 0,
      followingCount: 0,
      followerCount: 0,
      profilePhoto: "",
      username: "",
      firstName: "",
      lastName: "",
      presentation: "",
    );
  }
}
