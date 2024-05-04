part of 'authration_cubit.dart';

@immutable
sealed class AuthrationState {}

final class AuthrationInitial extends AuthrationState {}

final class AuthorizationLooding extends AuthrationState {}

final class AuthorizationSuccess extends AuthrationState {
  UserModel userData;
  AuthorizationSuccess({required this.userData});
}

final class AuthorizationFailure extends AuthrationState {
  final String errorMassage;

  AuthorizationFailure(this.errorMassage);
}
