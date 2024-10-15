class UserStoreDomain {
  final String userId;
  final String name;
  final String avatar;
  final String? description;
  UserStoreDomain(
      {required this.avatar,
      this.description,
      required this.name,
      required this.userId});
}