part of 'create_ride_cubit.dart';

@immutable
sealed class CreateRideState {}

final class CreateRideInitial extends CreateRideState {}

final class CreatRidesLooding extends CreateRideState {}

final class CreatRidesSuccess extends CreateRideState {}

final class CreatRidesFailure extends CreateRideState {
  final String errorMassage;

  CreatRidesFailure(this.errorMassage);
}
