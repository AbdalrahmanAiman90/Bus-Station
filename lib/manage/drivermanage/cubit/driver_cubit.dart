import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/data/repos/driver_repo/driver_repo_implemnt.dart';

import 'package:meta/meta.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(this.driverRepoImplemnt) : super(DriverInitial());
  final DriverRepoImplemnt driverRepoImplemnt;
  List<String> comments = [];

  fetchOneDriverData({required String id}) async {
    emit(DriverLooding());

    var result = await driverRepoImplemnt.fetchOneDriver(id);

    result.fold(
      (l) {
        emit(DriverFailure(l.errorMassage));
      },
      (r) {
        for (var i in r.review!) {
          comments.add(i.title!);
        }
        for (var i in comments) {
          log(i);
        }
        emit(DriverSuccess(r));
      },
    );
  }

  @override
  void onChange(Change<DriverState> change) {
    // TODO: implement onChange
    print(change);
  }
}
