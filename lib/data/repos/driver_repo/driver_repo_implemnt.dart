import 'dart:developer';

import 'package:bus_app/data/models/commint_model/commint_model.dart';
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
  Future<DriverModel> fetchOneDriver(String id) async {
    try {
      String endpoint = "user/getone/$id";

      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequest);

      DriverModel driverData = DriverModel.fromJson(data["data"]["data"]);
      log(driverData.review!.length.toString());
      return driverData;
    } on DioException catch (e) {
      // Handle DioException
      log(e.toString());
      throw ServerFailuar.fromDioError(e);
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      throw ServerFailuar(e.toString());
    }
  }

  @override
  Future<CommintModel> sendCommit(String id, String commint) async {
    try {
      String endpoint = "review/createone/$id";

      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };
      Map<String, dynamic> bodyRequest = {"title": commint, "rating": 3};
      var data = await apiServes.post(
          endpoint: endpoint,
          headerRequst: headerRequest,
          bodyRequst: bodyRequest);

      CommintModel commintData = CommintModel.fromJson(data["data"]);

      return commintData;
    } on DioException catch (e) {
      // Handle DioError
      log(e.toString());
      throw ServerFailuar.fromDioError(e); // Throw custom exception
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      throw ServerFailuar(e.toString()); // Throw custom exception
    }
  }

  @override
  Future<Either<Failure, List<DriverModel>>> fetchAllRide() async {
    try {
      String endpoint = "user/getall";

      Map<String, dynamic> headerRequst = {
        'Cookie': token,
      };

      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequst);
      List<DriverModel> allDriver = [];

      for (var i in data["data"]) {
        allDriver.add(DriverModel.fromJson(i));
      }

      return right(allDriver);
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
