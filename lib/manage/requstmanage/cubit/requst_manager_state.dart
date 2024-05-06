part of 'requst_manager_cubit.dart';

@immutable
sealed class RequstManagerState {}

final class RequstManagerCreatRequstInitial extends RequstManagerState {}

final class RequstManagerCreatRequstLooding extends RequstManagerState {}

final class RequstManagerCreatRequstSuccess extends RequstManagerState {}

final class RequstManagerCreatRequstFial extends RequstManagerState {
  String errorMassage;
  RequstManagerCreatRequstFial(this.errorMassage);
}

final class RequstManagerGetAllRequstLooding extends RequstManagerState {}

final class RequstManagerGetAlltSuccess extends RequstManagerState {}

final class RequstManagerGetAlltFial extends RequstManagerState {
  String errorMassage;
  RequstManagerGetAlltFial(this.errorMassage);
}

final class RequstManagerAcceptLooding extends RequstManagerState {}

final class RequstManagerAccepttSuccess extends RequstManagerState {}

final class RequstManagerAcceptecttFial extends RequstManagerState {
  String errorMassage;
  RequstManagerAcceptecttFial(this.errorMassage);
}
