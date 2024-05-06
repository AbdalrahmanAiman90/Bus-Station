part of 'driver_cubit.dart';

@immutable
sealed class DriverState {}

final class DriverInitial extends DriverState {}

final class DriverLooding extends DriverState {}

final class DriverSuccess extends DriverState {
  DriverModel driverModel;

  DriverSuccess(this.driverModel);
}

final class AllDriverSuccess extends DriverState {
  List<DriverModel> driverModel;

  AllDriverSuccess(this.driverModel);
}

final class DriverFailure extends DriverState {
  String errorMassage;
  DriverFailure(this.errorMassage);
}

final class CommintLooding extends DriverState {}

final class CommintSuccses extends DriverState {}

final class CommintFial extends DriverState {
  String errorMassage;
  CommintFial(this.errorMassage);
}
