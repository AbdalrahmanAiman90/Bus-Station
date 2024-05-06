import 'dart:io';

import 'package:bus_app/data/models/riders_model/rider_model.dart';
import 'package:bus_app/error/falur.dart';
import 'package:dartz/dartz.dart';

abstract class RideRepo {
  Future<Either<Failure, List<RideModel>>> fetchAllRide();
  Future<Either<Failure, RideModel>> creatRide(String name, String price, file);
}
