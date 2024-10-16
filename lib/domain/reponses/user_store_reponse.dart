class UserStoreDomain {
  final String userId;
  final String name;
  final String? avatar;
  final String? description;
  UserStoreDomain(
      {this.avatar,
      this.description,
      required this.name,
      required this.userId});

  UserStoreDomain.fromJson(Map<String, Object?> json)
      : this(
            userId: json["userId"] as String,
            name: json["name"] as String,
            avatar: json["avatar"] as String,
            description: json["description"] as String);

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'name': name,
      'avatar': avatar,
      'description': description,
    };
  }
}
