import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/notifacation_model/notification_model.dart';
import 'package:bus_app/data/repos/notificationRepo/notifacation_repo_impl.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/const.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'notifaction_cubit_state.dart';

class NotifactionCubit extends Cubit<NotifactionCubitState> {
  NotifactionCubit(this.notrepo) : super(NotifactionCubitInitial());
  NotifactionRepoImplemnt notrepo;
  ApiServes apiServes = ApiServes(creatdio());
  fetchAllNotifacation() async {
    emit(LoodingNotifactionCubit());
    var result = await notrepo.fetchNotifaction();
    result.fold((l) {
      emit(FailNotifactionCubit(l.errorMassage));
    }, (r) {
      log(r.length.toString());
      emit(SuccsNotifactionCubit(r));
    });
  }

  busArrinNote(String IdRequst) async {
    emit(LoodingBusNotifactionCubit());
    try {
      String endpoint = "req/acceptreq/$IdRequst";
      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      var data = await apiServes.post(
        endpoint: endpoint,
        headerRequst: headerRequest,
      );
      emit(SuccsesBusNotifactionCubit());
    } on DioException catch (e) {
      emit(FialBusNotifactionCubit());
    }
  }
}
