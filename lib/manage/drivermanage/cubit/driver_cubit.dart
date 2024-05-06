import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/commint_model/commint_model.dart';
import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/data/repos/commint_repo/commint_repo_implment.dart';
import 'package:bus_app/data/repos/driver_repo/driver_repo_implemnt.dart';

import 'package:meta/meta.dart';

part 'driver_state.dart';

CommentService commentService = CommentService();

class DriverCubit extends Cubit<DriverState> {
  DriverCubit(
    this.driverRepoImplemnt,
  ) : super(DriverInitial());
  final DriverRepoImplemnt driverRepoImplemnt;

  fetchOneDriverData({required String id}) async {
    commentService.clearComments();
    emit(DriverLooding());

    try {
      var result = await driverRepoImplemnt.fetchOneDriver(id);
      if (result != null) {
        for (var i in result.review!) {
          commentService.addComment(id, i.title!);
        }
        emit(DriverSuccess(result));
      } else {
        emit(DriverFailure("Failed to fetch driver data"));
      }
    } catch (e) {
      emit(DriverFailure("An error occurred: $e"));
    }
  }

  sendCoomint(String id, String commintText) async {
    emit(CommintLooding());

    try {
      var result = await driverRepoImplemnt.sendCommit(id, commintText);
      if (result != null) {
        commentService.addComment(id, commintText);
        emit(CommintSuccses());
      } else {
        emit(CommintFial("Failed to send comment"));
      }
    } catch (e) {
      emit(CommintFial("An error occurred: $e"));
    }
  }

  fetchAllDriverData() async {
    emit(DriverLooding());

    var result = await driverRepoImplemnt.fetchAllRide();
    result.fold((l) {
      emit(DriverFailure(l.errorMassage));
    }, (r) {
      emit(AllDriverSuccess(r));
    });
  }

  @override
  void onChange(Change<DriverState> change) {
    // TODO: implement onChange
    log(change.toString());
  }
}

class CommentService {
  // Map to store comments for each driver
  Map<String, List<String>> commentsMap = {};

  // Method to add comments for a driver
  void addComment(String driverId, String comment) {
    if (commentsMap.containsKey(driverId)) {
      commentsMap[driverId]!
          .add(comment); // Append the comment to the existing list
    } else {
      commentsMap[driverId] = [comment]; // Create a new list with the comment
    }
  }

  // Method to retrieve comments for a driver
  List<String>? getComments(String driverId) {
    return commentsMap[driverId];
  }

  void clearComments() {
    commentsMap.clear();
  }
}
