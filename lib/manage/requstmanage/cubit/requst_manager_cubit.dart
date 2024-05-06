import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/requst_model/creat_requst/creat_requst.dart';
import 'package:bus_app/data/models/requst_model/getall_requst/getall_requsts.dart';
import 'package:bus_app/error/falur.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/const.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'requst_manager_state.dart';

class RequstManagerCubit extends Cubit<RequstManagerState> {
  RequstManagerCubit() : super(RequstManagerCreatRequstInitial());
  ApiServes apiServes = ApiServes(creatdio());
  String? stutsRequst;
  String? station;
  List<GetAllRqustModel> allRequst = [];
  createRideRequst({
    required String idRide,
  }) async {
    emit(RequstManagerCreatRequstLooding());
    try {
      String endpoint = "req/createone/$idRide";
      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      Map<String, dynamic> bodyRequest = {"station": station};
      var data = await apiServes.post(
          endpoint: endpoint,
          headerRequst: headerRequest,
          bodyRequst: bodyRequest);
      CreateRqustModel createRqustModel =
          CreateRqustModel.fromJson(data["data"]);
      log("الحاجه بتاعت انه عمل ريكوست");
      log(createRqustModel.station ?? "salmiya 66X");
      stutsRequst = createRqustModel.status;
      emit(RequstManagerCreatRequstSuccess());
    } on DioException catch (e) {
      emit(RequstManagerCreatRequstFial(e.toString()));
    }
  }

  getAllRequst() async {
    allRequst = [];
    emit(RequstManagerGetAllRequstLooding());
    try {
      String endpoint = "req/getall";
      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      var data = await apiServes.get(
        endPoint: endpoint,
        headerRequst: headerRequest,
      );

      for (var i in data["data"]) {
        allRequst.add(GetAllRqustModel.fromJson(i));
      }
      log("الحاجه بتاعت انه عمل ريكوست");
      log(allRequst.length.toString());
      emit(RequstManagerGetAlltSuccess());
    } on DioException catch (e) {
      emit(RequstManagerGetAlltFial(e.toString()));
    }
  }

  accept({required String idreqist}) async {
    emit(RequstManagerAcceptLooding());
    try {
      String endpoint = "req/acceptreq/$idreqist";
      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      var data = await apiServes.patch(
        endpoint: endpoint,
        headerRequst: headerRequest,
      );
      log(allRequst.length.toString());
      emit(RequstManagerAccepttSuccess());
    } on DioException catch (e) {
      emit(RequstManagerCreatRequstFial(e.toString()));
    }
  }

  reject({required String idreqist}) async {
    emit(RequstManagerAcceptLooding());
    try {
      String endpoint = "req/rejectreq/$idreqist";
      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      var data = await apiServes.patch(
        endpoint: endpoint,
        headerRequst: headerRequest,
      );

      log(allRequst.length.toString());
      emit(RequstManagerAccepttSuccess());
    } on DioException catch (e) {
      emit(RequstManagerCreatRequstFial(e.toString()));
    }
  }

  @override
  void onChange(Change<RequstManagerState> change) {
    // TODO: implement onChange
    log(change.toString());
  }
}
