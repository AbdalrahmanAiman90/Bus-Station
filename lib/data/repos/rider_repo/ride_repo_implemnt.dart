import 'dart:io';

import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/data/repos/rider_repo/ride_repo.dart';
import 'package:bus_app/error/falur.dart';
import 'package:bus_app/shared/api_serves.dart';
import 'package:bus_app/shared/const.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class RideRepoImplemntion extends RideRepo {
  final ApiServes apiServes;
  RideRepoImplemntion(this.apiServes);
  @override
  Future<Either<Failure, List<RideModel>>> fetchAllRide() async {
    try {
      String endpoint = "ride/getall";

      Map<String, dynamic> headerRequst = {
        'Cookie': token,
      };
      var data =
          await apiServes.get(endPoint: endpoint, headerRequst: headerRequst);
      List<RideModel> allRides = [];
      for (var i in data["data"]) {
        allRides.add(RideModel.fromJson(i));
      }
      return right(allRides);
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

  @override
  Future<Either<Failure, RideModel>> creatRide(
      String name, String price, image) async {
    try {
      String endpoint = "ride/createone";

      Map<String, dynamic> headerRequest = {
        'Cookie': token,
      };

      FormData formData =
          FormData.fromMap({"image": image, "name": name, "price": price});

      var data = await apiServes.post(
          endpoint: endpoint,
          headerRequst: headerRequest,
          bodyRequst: formData);

      RideModel rideData = RideModel.fromJson(data);
      return right(rideData);
    } on DioException catch (e) {
      // Handle DioError separately
      return left(ServerFailuar.fromDioError(e));
    } catch (e) {
      // Handle other exceptions
      return left(ServerFailuar(e.toString()));
    }
  }
}
