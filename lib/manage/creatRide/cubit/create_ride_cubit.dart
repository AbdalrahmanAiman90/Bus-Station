import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:meta/meta.dart';

part 'create_ride_state.dart';

class CreateRideCubit extends Cubit<CreateRideState> {
  CreateRideCubit(this.rideRepo) : super(CreateRideInitial());
  final RideRepo rideRepo;
  addRide(String name, String price, image) async {
    emit(CreatRidesLooding());
    var result = await rideRepo.creatRide(name, price, image);
    result.fold((l) {
      emit(CreatRidesFailure(l.errorMassage));
    }, (r) {
      emit(CreatRidesSuccess());
    });
  }
}
