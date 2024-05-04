import 'dart:developer';

import 'package:bus_app/data/models/driver_model/driver_model.dart';
import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/data/repos/driver_repo/driver_repo.dart';
import 'package:bus_app/error/falur.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/const.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DriverRepoImplemnt extends DriverRepo {
  final ApiServes apiServes;
  DriverRepoImplemnt(this.apiServes);
  @override
  Future<Either<Failure, DriverModel>> fetchOneDriver(String id) async {
    try {
      String endpoint = "user/getone/$id";

      Map<String, dynamic> headerRequst = {
        'Cookie': token,
      };
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequst);

      DriverModel driverData = DriverModel.fromJson(data["data"]["data"]);
      log(driverData.review!.length.toString());
      return right(driverData);
    } on Exception catch (e) {
      if (e is DioException) {
        // log(e.toString());
        return left(ServerFailuar.fromDioError(e)); //! return
      } else {
        // log(e.toString());
        return left(ServerFailuar(e.toString())); //! return
      }
    }
  }
}
