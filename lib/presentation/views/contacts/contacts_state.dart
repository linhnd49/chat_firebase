import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/reponses/user_store_reponse.dart';

part 'contacts_state.g.dart';

@CopyWith()
class ContactsState extends Equatable {
  final Map<String, List<UserStoreDomain>>? listContact;

  const ContactsState({this.listContact});
  @override
  List<Object?> get props => [listContact];
}
