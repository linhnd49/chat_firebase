import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
part 'register_state.g.dart';

@CopyWith()
class RegisterState extends Equatable {
  final bool? isSuccess;
  final bool? isLoading;
  const RegisterState({this.isLoading, this.isSuccess});

  @override
  List<Object?> get props => [isSuccess, isLoading];
}
