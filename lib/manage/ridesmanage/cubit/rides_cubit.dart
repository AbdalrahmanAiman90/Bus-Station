import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:meta/meta.dart';

part 'rides_state.dart';

class RidesCubit extends Cubit<RidesState> {
  RidesCubit(this.rideRepo) : super(RidesInitial());
  final RideRepo rideRepo;
  fetchAllRides() async {
    emit(RidesLooding());

    var result = await rideRepo.fetchAllRide();
    result.fold((l) {
      emit(RidesFailure(l.errorMassage));
    }, (r) {
      emit(RidesSuccess(r));
    });
  }

  @override
  void onChange(Change<RidesState> change) {
    // TODO: implement onChange
    print(change);
  }
}
