import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:softbase/presentation/views/contacts/domain/contacts_domain.dart';

part 'contacts_state.g.dart';

@CopyWith()
class ContactsState extends Equatable {
  final Map<String, List<ContactsItemDomain>>? listContact;

  const ContactsState({this.listContact});
  @override
  List<Object?> get props => [listContact];
}
