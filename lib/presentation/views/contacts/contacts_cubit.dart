import 'package:injectable/injectable.dart';
import 'package:softbase/presentation/views/base/base_cubit.dart';
import 'package:softbase/presentation/views/contacts/contacts_state.dart';
import 'package:softbase/presentation/views/contacts/domain/contacts_domain.dart';

@singleton
class ContactsCubit extends BaseCubit<ContactsState> {
  ContactsCubit() : super(const ContactsState());

  final List<ContactsItemDomain> _listContacts = [
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/18936031/pexels-photo-18936031/free-photo-of-nha-hang-bbq-han-qu-c.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        description: "Life is beautiful 👌",
        name: "Afrin Sabila ",
        id: "1"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/27163466/pexels-photo-27163466/free-photo-of-dan-ba-tay-t-i-bong.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        description: "Be your own hero 💪",
        name: "Adil Adnan",
        id: "2"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/28494944/pexels-photo-28494944.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        description: "Keep working",
        name: "Bristy Haque",
        id: "3"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/28494944/pexels-photo-28494944.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        description: "Make yourself proud 😍",
        name: "John Borino",
        id: "4"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/28494944/pexels-photo-28494944.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        description: "Flowers are beautiful 🌸",
        name: "Borsha Akther",
        id: "5"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/9929885/pexels-photo-9929885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        name: "sheik Sadi ",
        id: "6"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/9929885/pexels-photo-9929885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        name: "sheik Sadi ",
        id: "6"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/9929885/pexels-photo-9929885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        name: "sheik Sadi ",
        id: "6"),
    ContactsItemDomain(
        avatar:
            "https://images.pexels.com/photos/9929885/pexels-photo-9929885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        name: "sheik Sadi ",
        id: "6")
  ];

  initListContacts() {
    _listContacts.sort((a, b) => a.name.compareTo(b.name));
    Map<String, List<ContactsItemDomain>> groupedItems = {};

    for (ContactsItemDomain item in _listContacts) {
      final firstText = item.name[0].toUpperCase();
      if (groupedItems[firstText] == null) {
        groupedItems[firstText] = [];
      }
      groupedItems[firstText]!.add(item);
    }

    emit(state.copyWith(listContact: groupedItems));
  }
}
