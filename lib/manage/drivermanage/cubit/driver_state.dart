part of 'driver_cubit.dart';

@immutable
sealed class DriverState {}

final class DriverInitial extends DriverState {}

final class DriverLooding extends DriverState {}

final class DriverSuccess extends DriverState {
  DriverModel driverModel;

  DriverSuccess(this.driverModel);
}

final class DriverFailure extends DriverState {
  String errorMassage;
  DriverFailure(this.errorMassage);
}

final class DriverSuccessUpdated extends DriverState {
  List<String> commints;
  DriverSuccessUpdated(this.commints);
}
