class ContactsItemDomain {
  final String id;
  final String name;
  final String avatar;
  final String? description;
  ContactsItemDomain(
      {required this.avatar,
      this.description,
      required this.name,
      required this.id});
}
