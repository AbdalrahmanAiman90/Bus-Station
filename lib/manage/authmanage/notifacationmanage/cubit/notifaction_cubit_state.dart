part of 'notifaction_cubit_cubit.dart';

@immutable
sealed class NotifactionCubitState {}

final class NotifactionCubitInitial extends NotifactionCubitState {}

final class LoodingNotifactionCubit extends NotifactionCubitState {}

final class SuccsNotifactionCubit extends NotifactionCubitState {
  List<NotifactionModel> allNotifacation;
  SuccsNotifactionCubit(this.allNotifacation);
}

final class FailNotifactionCubit extends NotifactionCubitState {
  String errorMassage;
  FailNotifactionCubit(this.errorMassage);
}

final class BusArriveSuccses extends NotifactionCubitState {}

final class LoodingBusNotifactionCubit extends NotifactionCubitState {}

final class SuccsesBusNotifactionCubit extends NotifactionCubitState {}

final class FialBusNotifactionCubit extends NotifactionCubitState {}
