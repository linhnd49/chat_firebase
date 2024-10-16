import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.g.dart';

@CopyWith()
class SplashState extends Equatable {
  final bool? isSuccess;

  const SplashState({this.isSuccess});
  
  @override
  List<Object?> get props => [isSuccess];
}
