class ProfileModel {
  final int id, recipesCount, followingCount, followerCount;
  final String profilePhoto, username, firstName, lastName, presentation;

  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      recipesCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      presentation: json["presentation"],
    );
  }

  factory ProfileModel.empty() {
    return ProfileModel(
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
