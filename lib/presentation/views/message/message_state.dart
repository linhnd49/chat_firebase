import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'message_state.g.dart';

@CopyWith()
class MessageState extends Equatable {
  final bool? noMoreData;
  final DioException? error;

  const MessageState({this.error, this.noMoreData = true});

  @override
  List<Object?> get props => [noMoreData, error];
}
