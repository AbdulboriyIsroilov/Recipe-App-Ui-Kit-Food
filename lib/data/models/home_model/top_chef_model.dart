class TopChefModel {
  final String username, firstName, lastName, profilePhoto;
  final int id;

  TopChefModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json["id"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      profilePhoto: json["profilePhoto"],
    );
  }
}
