part of 'rides_cubit.dart';

@immutable
sealed class RidesState {}

final class RidesInitial extends RidesState {}

final class RidesLooding extends RidesState {}

final class RidesSuccess extends RidesState {
  List<RideModel> allRides;
  RidesSuccess(this.allRides);
}

final class RidesFailure extends RidesState {
  final String errorMassage;

  RidesFailure(this.errorMassage);
}
