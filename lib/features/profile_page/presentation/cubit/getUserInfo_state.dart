part of 'getUserInfo_cubit.dart';

sealed class GetUserInfoState extends Equatable {
  const GetUserInfoState();

  @override
  List<Object> get props => [];
}

final class GetUserInfoInitial extends GetUserInfoState {}


class GetUserInfoLoading extends GetUserInfoState {}

class GetUserInfoFailed extends GetUserInfoState {
  final StackTrace stackTrace;
  final Object exception;

  const GetUserInfoFailed(this.exception, this.stackTrace);
}

class GetUserInfoSucceed extends GetUserInfoState {
  final GetUserInfoResponseModel model;

  const GetUserInfoSucceed({
    required this.model,
  });
}
